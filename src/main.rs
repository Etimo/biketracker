mod deskbike;

use blurz::bluetooth_session::BluetoothSession;
// use blurz::bluetooth_adapter::BluetoothAdapter;
// use blurz::bluetooth_device::BluetoothDevice;
// use blurz::bluetooth_event::BluetoothEvent;
// use blurz::bluetooth_discovery_session::BluetoothDiscoverySession;
// use blurz::bluetooth_gatt_service::BluetoothGATTService;
// use blurz::bluetooth_gatt_characteristic::BluetoothGATTCharacteristic;
// use std::error::Error;

// static DESKBIKE_ALIAS_PREFIX: &'static str = "deskbike";

// static BLUETOOTH_SERVICE_CYCLING_SPEED_CADENCE: &'static str = "00001816-0000-1000-8000-00805f9b34fb";
// static BLUETOOTH_CHARACTERISTIC_CSC_MEASUREMENT: &'static str = "00002a5b-0000-1000-8000-00805f9b34fb";

// fn bluetooth_get_service_by_uuid<'s>(session: &'s BluetoothSession, device: &BluetoothDevice, service_uuid: &str) -> Result<Option<BluetoothGATTService<'s>>, Box<dyn Error>> {
//     for path in device.get_gatt_services()? {
//         let service = BluetoothGATTService::new(&session, path);
//         if service.get_uuid()? == service_uuid {
//             return Ok(Some(service));
//         }
//     }
//     Ok(None)
// }

// fn bluetooth_get_characteristic_by_uuid<'s>(session: &'s BluetoothSession, service: &BluetoothGATTService, characteristic_uuid: &str) -> Result<Option<BluetoothGATTCharacteristic<'s>>, Box<dyn Error>> {
//     for path in service.get_gatt_characteristics()? {
//         let characteristic = BluetoothGATTCharacteristic::new(&session, path);
//         if characteristic.get_uuid()? == characteristic_uuid {
//             return Ok(Some(characteristic));
//         }
//     }
//     Ok(None)
// }

fn main() {
    let mut deskbike_session = deskbike::DeskbikeSession::connect().unwrap();
    for value in deskbike_session.measurements() {
        dbg!(value);
    }

    // println!("Setting up bluetooth");
    // let session = BluetoothSession::create_session(None).unwrap();
    // let adapter = BluetoothAdapter::init(&session).unwrap();
    // let discovery_session = BluetoothDiscoverySession::create_session(&session, adapter.get_id()).unwrap();
    // discovery_session.start_discovery().unwrap();

    // println!("Scanning");
    // loop {
    //     for msg in session.incoming(100) {
    //         // dbg!(&msg);
    //         if let Some(event) = BluetoothEvent::from(msg) {
    //             match event {
    //                 BluetoothEvent::RSSI {
    //                     object_path,
    //                     rssi: _,
    //                 } => {
    //                     let device = BluetoothDevice::new(&session, object_path);
    //                     let device_name = device.get_alias().unwrap();
    //                     if device_name.starts_with(DESKBIKE_ALIAS_PREFIX) {
    //                         println!("Connecting to {}...", device.get_alias().unwrap());
    //                         device.connect(10000).unwrap();
    //                         println!("Done!");
    //                         if let Some(csc_service) = bluetooth_get_service_by_uuid(&session, &device, BLUETOOTH_SERVICE_CYCLING_SPEED_CADENCE).unwrap() {
    //                             if let Some(csc_measurement) = bluetooth_get_characteristic_by_uuid(&session, &csc_service, BLUETOOTH_CHARACTERISTIC_CSC_MEASUREMENT).unwrap() {
    //                                 dbg!(&csc_measurement);
    //                                 csc_measurement.start_notify().unwrap();
    //                             }
    //                         }
    //                     }
    //                 },
    //                 BluetoothEvent::Value {
    //                     object_path,
    //                     value,
    //                 } => {
    //                     dbg!("Value!");
    //                     dbg!(object_path);
    //                     dbg!(value);
    //                 }
    //                 _ => {},
    //             }
    //         }
    //     }
    // }
    // loop {
    //     for device_addr in adapter.get_device_list().unwrap() {
    //         let device = BluetoothDevice::new(&session, device_addr);
    //         dbg!(device);
    //     }
    // }
}
