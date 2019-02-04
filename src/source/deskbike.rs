use blurz::bluetooth_adapter::BluetoothAdapter;
use blurz::bluetooth_device::BluetoothDevice;
use blurz::bluetooth_discovery_session::BluetoothDiscoverySession;
use blurz::bluetooth_event::BluetoothEvent;
use blurz::bluetooth_gatt_characteristic::BluetoothGATTCharacteristic;
use blurz::bluetooth_gatt_service::BluetoothGATTService;
use blurz::bluetooth_session::BluetoothSession;
use dbus;
use failure::{Fail, Error};
use std::error::{Error as StdError};

/// Wheel circumference in meters
///
/// Rough guess based on http://www.bikecalc.com/wheel_size_math, and
/// https://www.centurycycles.com/tips/tech-talk-know-your-tire-size-pg1275.htm
static DESKBIKE_WHEEL_CIRCUMFERENCE_METERS: f64 = 2.14;

static DESKBIKE_BLUETOOTH_ALIAS_PREFIX: &'static str = "deskbike";

static BLUETOOTH_SERVICE_CYCLING_SPEED_CADENCE: &'static str =
    "00001816-0000-1000-8000-00805f9b34fb";
static BLUETOOTH_CHARACTERISTIC_CSC_MEASUREMENT: &'static str =
    "00002a5b-0000-1000-8000-00805f9b34fb";

fn bluetooth_get_service_by_uuid<'s>(
    session: &'s BluetoothSession,
    device: &BluetoothDevice,
    service_uuid: &str,
) -> Result<Option<BluetoothGATTService<'s>>, DeskbikeError> {
    for path in device.get_gatt_services().map_err(bt_err)? {
        let service = BluetoothGATTService::new(&session, path);
        if service.get_uuid().map_err(bt_err)? == service_uuid {
            return Ok(Some(service));
        }
    }
    Ok(None)
}

fn bluetooth_get_characteristic_by_uuid<'s>(
    session: &'s BluetoothSession,
    service: &BluetoothGATTService,
    characteristic_uuid: &str,
) -> Result<Option<BluetoothGATTCharacteristic<'s>>, DeskbikeError> {
    for path in service.get_gatt_characteristics().map_err(bt_err)? {
        let characteristic = BluetoothGATTCharacteristic::new(&session, path);
        if characteristic.get_uuid().map_err(bt_err)? == characteristic_uuid {
            return Ok(Some(characteristic));
        }
    }
    Ok(None)
}

#[derive(Debug, Fail)]
pub enum DeskbikeError {
    #[fail(display = "bluetooth error: {}", cause)]
    BluetoothError {
        #[fail(cause)]
        cause: Error,
    },
    #[fail(display = "can't find CSC service on device {}", device_path)]
    NoCscServiceOnDevice { device_path: String },
    #[fail(
        display = "can't find CSC measurement characteristic on service {}",
        service_path
    )]
    NoCscMeasurementCharacteristicOnService { service_path: String },
    #[fail(
        display = "received an invalid CSC measurement value: {}",
        cause_message
    )]
    InvalidCscMeasurement { cause_message: String },
}

fn bt_err(inner: Box<dyn StdError + Send + Sync>) -> DeskbikeError {
    DeskbikeError::BluetoothError {
        cause: Error::from_boxed_compat(inner),
    }
}

struct DiscoverySessionGuard<'a> {
    discovery_session: BluetoothDiscoverySession<'a>,
}

impl<'a> DiscoverySessionGuard<'a> {
    fn new(session: &'a BluetoothSession, adapter: &BluetoothAdapter) -> Result<DiscoverySessionGuard<'a>, DeskbikeError> {
        let discovery_session = BluetoothDiscoverySession::create_session(session, adapter.get_id()).map_err(bt_err)?;
        discovery_session.start_discovery().map_err(bt_err)?;
        Ok(DiscoverySessionGuard {
            discovery_session,
        })
    }
}

impl<'a> Drop for DiscoverySessionGuard<'a> {
    fn drop(&mut self) {
        // We can't return an error from Drop,
        // but this isn't bad enough to panic! over
        self.discovery_session.stop_discovery().unwrap_or_else(|err| println!("Failed to stop discovery: {}", err));
    }
}

fn find_device<'a, F>(session: &'a BluetoothSession, adapter: &BluetoothAdapter, mut pred: F) -> Result<BluetoothDevice<'a>, DeskbikeError> where F: FnMut(&BluetoothDevice) -> bool {
    for known_device in adapter.get_device_list().map_err(bt_err)? {
        let device = BluetoothDevice::new(session, known_device);
        if pred(&device) {
            return Ok(device);
        }
    }

    // Failed to find known device, let's try to discover it
    let _disc_session = DiscoverySessionGuard::new(session, adapter);
    loop {
        for msg in session.incoming(100) {
            match BluetoothEvent::from(msg) {
                Some(BluetoothEvent::RSSI {
                    object_path,
                    rssi: _,
                }) |
                Some(BluetoothEvent::Connected {
                    object_path,
                    connected: true,
                }) => {
                    let device = BluetoothDevice::new(session, object_path);
                    if pred(&device) {
                        return Ok(device);
                    }
                },
                _ => {}
            }
        }
    }
}

pub struct DeskbikeSession {
    bluetooth_session: BluetoothSession,
    device_path: String,
    csc_measurement_path: String,
}

impl DeskbikeSession {
    pub fn connect() -> Result<DeskbikeSession, DeskbikeError> {
        println!("Setting up bluetooth");
        let bt_session = BluetoothSession::create_session(None).map_err(bt_err)?;
        let adapter = BluetoothAdapter::init(&bt_session).map_err(bt_err)?;

        println!("Scanning");
        let device = find_device(&bt_session, &adapter, |device| {
            device.get_alias().map(|alias| alias.starts_with(DESKBIKE_BLUETOOTH_ALIAS_PREFIX)).unwrap_or(false)
        })?;
        println!("Connecting to {}...", device.get_alias().map_err(bt_err)?);
        if !device.is_connected().map_err(bt_err)? {
            device.connect(10000).map_err(bt_err)?;
            println!("Connected!");
        } else {
            println!("Already connected!");
        }
        println!("Finding characteristic...");
        let csc_service = bluetooth_get_service_by_uuid(
            &bt_session,
            &device,
            BLUETOOTH_SERVICE_CYCLING_SPEED_CADENCE,
        )?
            .ok_or(DeskbikeError::NoCscServiceOnDevice {
                device_path: device.get_id(),
            })?;
        let csc_measurement = bluetooth_get_characteristic_by_uuid(
            &bt_session,
            &csc_service,
            BLUETOOTH_CHARACTERISTIC_CSC_MEASUREMENT,
        )?
            .ok_or(DeskbikeError::NoCscMeasurementCharacteristicOnService {
                service_path: csc_service.get_id(),
            })?;
        println!("Subscribing...");
        csc_measurement.start_notify().map_err(bt_err)?;
        return Ok(DeskbikeSession {
            device_path: device.get_id(),
            csc_measurement_path: csc_measurement.get_id(),
            bluetooth_session: bt_session,
        });
    }
}

impl super::BikeSession for DeskbikeSession {
    type Measurement = CscMeasurement;
    type MeasureError = DeskbikeError;

    fn measurements<'a>(&'a mut self) -> Box<dyn Iterator<Item = Result<CscMeasurement, DeskbikeError>> + 'a> {
        Box::new(CscMeasurements {
            incoming_dbus: self.bluetooth_session.incoming(100),
            device_path: self.device_path.clone(),
            characteristic_path: self.csc_measurement_path.clone(),
        })
    }
}

// Defined in https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.csc_measurement.xml
struct CscMeasurementFlags {
    wheel_revolution_data_present: bool,
    crank_revolution_data_present: bool,
}

// Defined in https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.csc_measurement.xml
#[derive(PartialEq, Eq, Debug)]
pub struct CscMeasurement {
    pub cumulative_wheel_revolutions: Option<u32>,
    pub last_wheel_event_time: Option<u16>,
    pub cumulative_crank_revolutions: Option<u16>,
    pub last_crank_event_time: Option<u16>,
}

impl CscMeasurement {
    fn from_bytes(bytes: &[u8]) -> Result<CscMeasurement, DeskbikeError> {
        match parsers::csc_measurement(bytes) {
            Ok((&[], measurement)) => Ok(measurement),
            Ok((remaining, _)) => Err(DeskbikeError::InvalidCscMeasurement {
                cause_message: format!("{} leftover bytes: {:?}", remaining.len(), remaining),
            }),
            Err(error) => Err(DeskbikeError::InvalidCscMeasurement {
                cause_message: error.to_string(),
            }),
        }
    }
}

impl super::BikeMeasurement for CscMeasurement {
    fn cumulative_wheel_meters(&self) -> Option<f64> {
        return Some(self.cumulative_wheel_revolutions? as f64 * DESKBIKE_WHEEL_CIRCUMFERENCE_METERS);
    }
}

pub struct CscMeasurements<'a> {
    incoming_dbus: dbus::ConnMsgs<&'a dbus::Connection>,
    device_path: String,
    characteristic_path: String,
}

mod parsers {
    use super::{CscMeasurement, CscMeasurementFlags};
    use nom::*;

    named!(csc_measurement_flags(&[u8]) -> CscMeasurementFlags,
           bits!(do_parse!(
               take_bits!(u8, 6) >> // Reserved
                   crank_revolution_data_present: take_bits!(u8, 1) >>
                   wheel_revolution_data_present: take_bits!(u8, 1) >>
                   (CscMeasurementFlags {
                       wheel_revolution_data_present: wheel_revolution_data_present > 0,
                       crank_revolution_data_present: crank_revolution_data_present > 0,
                   })
           ))
    );

    named!(pub csc_measurement(&[u8]) -> CscMeasurement,
           do_parse!(
               flags: csc_measurement_flags >>
                   cumulative_wheel_revolutions: u32!(Endianness::Little) >>
                   last_wheel_event_time: u16!(Endianness::Little) >>
                   cumulative_crank_revolutions: u16!(Endianness::Little) >>
                   last_crank_event_time: u16!(Endianness::Little) >>
                   (CscMeasurement {
                       cumulative_wheel_revolutions: if flags.wheel_revolution_data_present { Some(cumulative_wheel_revolutions) } else { None },
                       last_wheel_event_time: if flags.wheel_revolution_data_present { Some(last_wheel_event_time) } else { None },
                       cumulative_crank_revolutions: if flags.crank_revolution_data_present { Some(cumulative_crank_revolutions) } else { None },
                       last_crank_event_time: if flags.crank_revolution_data_present { Some(last_crank_event_time) } else { None },
                   })
           )
    );
}

impl<'a> Iterator for CscMeasurements<'a> {
    type Item = Result<CscMeasurement, DeskbikeError>;

    fn next(&mut self) -> Option<Self::Item> {
        loop {
            for msg in &mut self.incoming_dbus {
                match BluetoothEvent::from(msg) {
                    Some(BluetoothEvent::Value {
                        ref value,
                        ref object_path,
                    }) if object_path == &self.characteristic_path => {
                        return Some(CscMeasurement::from_bytes(value));
                    }
                    Some(BluetoothEvent::Connected {
                        connected: false,
                        ref object_path,
                    }) if object_path == &self.device_path => return None,
                    _ => {}
                }
            }
        }
    }
}
