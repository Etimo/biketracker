use blurz::bluetooth_session::BluetoothSession;
use blurz::bluetooth_adapter::BluetoothAdapter;
use blurz::bluetooth_device::BluetoothDevice;
use blurz::bluetooth_event::BluetoothEvent;
use blurz::bluetooth_discovery_session::BluetoothDiscoverySession;
use blurz::bluetooth_gatt_service::BluetoothGATTService;
use blurz::bluetooth_gatt_characteristic::BluetoothGATTCharacteristic;
use dbus;
use std::error::Error;
use failure::{Fail, ResultExt};
// use packed_struct::prelude::*;
// // use packed_struct::packing::packing_slice;
// use packed_struct_codegen::PackedStruct;

static DESKBIKE_ALIAS_PREFIX: &'static str = "deskbike";

static BLUETOOTH_SERVICE_CYCLING_SPEED_CADENCE: &'static str = "00001816-0000-1000-8000-00805f9b34fb";
static BLUETOOTH_CHARACTERISTIC_CSC_MEASUREMENT: &'static str = "00002a5b-0000-1000-8000-00805f9b34fb";

fn bluetooth_get_service_by_uuid<'s>(session: &'s BluetoothSession, device: &BluetoothDevice, service_uuid: &str) -> Result<Option<BluetoothGATTService<'s>>, Box<dyn Error>> {
    for path in device.get_gatt_services()? {
        let service = BluetoothGATTService::new(&session, path);
        if service.get_uuid()? == service_uuid {
            return Ok(Some(service));
        }
    }
    Ok(None)
}

fn bluetooth_get_characteristic_by_uuid<'s>(session: &'s BluetoothSession, service: &BluetoothGATTService, characteristic_uuid: &str) -> Result<Option<BluetoothGATTCharacteristic<'s>>, Box<dyn Error>> {
    for path in service.get_gatt_characteristics()? {
        let characteristic = BluetoothGATTCharacteristic::new(&session, path);
        if characteristic.get_uuid()? == characteristic_uuid {
            return Ok(Some(characteristic));
        }
    }
    Ok(None)
}

#[derive(Debug, Fail)]
pub enum DeskbikeError {
    #[fail(display = "can't find CSC service on device {}", device_path)]
    NoCscServiceOnDevice {
        device_path: String,
    },
    #[fail(display = "can't find CSC measurement characteristic on service {}", service_path)]
    NoCscMeasurementCharacteristicOnService {
        service_path: String,
    },
    #[fail(display = "received an invalid CSC measurement value: {}", cause_message)]
    InvalidCscMeasurement {
        cause_message: String,
    },
}

pub struct DeskbikeSession {
    bluetooth_session: BluetoothSession,
}

impl DeskbikeSession {
    pub fn connect() -> Result<DeskbikeSession, Box<dyn Error>> {
        println!("Setting up bluetooth");
        let bt_session = BluetoothSession::create_session(None)?;
        let adapter = BluetoothAdapter::init(&bt_session)?;

        let discovery_session = BluetoothDiscoverySession::create_session(&bt_session, adapter.get_id())?;
        discovery_session.start_discovery()?;

        println!("Scanning");
        loop {
            for msg in bt_session.incoming(100) {
                if let Some(event) = BluetoothEvent::from(msg) {
                    match event {
                        BluetoothEvent::RSSI {
                            object_path,
                            rssi: _,
                        } => {
                            let device = BluetoothDevice::new(&bt_session, object_path);
                            let device_name = device.get_alias()?;
                            if device_name.starts_with(DESKBIKE_ALIAS_PREFIX) {
                                println!("Connecting to {}...", device.get_alias()?);
                                device.connect(10000)?;
                                println!("Connected!");
                                let csc_service = bluetooth_get_service_by_uuid(&bt_session, &device, BLUETOOTH_SERVICE_CYCLING_SPEED_CADENCE)?.ok_or(DeskbikeError::NoCscServiceOnDevice{device_path: device.get_id()}).compat()?;
                                let csc_measurement = bluetooth_get_characteristic_by_uuid(&bt_session, &csc_service, BLUETOOTH_CHARACTERISTIC_CSC_MEASUREMENT)?.ok_or(DeskbikeError::NoCscMeasurementCharacteristicOnService{service_path: csc_service.get_id()}).compat()?;
                                discovery_session.stop_discovery()?;
                                csc_measurement.start_notify()?;
                                return Ok(DeskbikeSession {
                                    bluetooth_session: bt_session,
                                })
                            }
                        },
                        _ => {},
                    }
                }
            }
        }
    }

    pub fn measurements(&mut self) -> CscMeasurements {
        CscMeasurements {
            incoming_dbus: self.bluetooth_session.incoming(100),
        }
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

pub struct CscMeasurements<'a> {
    incoming_dbus: dbus::ConnMsgs<&'a dbus::Connection>,
}

mod parsers {
    use nom::*;
    use super::{CscMeasurementFlags, CscMeasurement};

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
                        value,
                        object_path: _,
                    }) => {
                        return Some(CscMeasurement::from_bytes(&value))
                    },
                    _ => {},
                }
            }
        }
        None
    }
}
