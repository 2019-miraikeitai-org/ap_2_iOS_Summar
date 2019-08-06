//
//  AViewController.swift
//  iOS-Practice-Team-Working
//
//  Created by reiji kobayashi on 2019/06/27.
//  Copyright © 2019 reud. All rights reserved.
//
//  ViewController.swift
//  location_0731
//
//  Created by 吉田れい on 2019/07/31.
//  Copyright © 2019 吉田れい. All rights reserved.
//

import UIKit
import CoreLocation


class AViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 緯度、経度表示用のラベル
        label = UILabel()
        label.frame.size = CGSize(width: 200, height: 120)
        label.center = view.center
        label.numberOfLines = 0
        view.addSubview(label)
        
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .restricted, .denied:
            print("拒否されている")
            break
        case .notDetermined:
            locationManager.delegate = self
            locationManager.distanceFilter = 10
            locationManager.startUpdatingLocation()
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.delegate = self
            locationManager.distanceFilter = 10
            locationManager?.startUpdatingLocation()
        default:
            break
        }
    }
    
    // 緯度経度に変更があったら呼ばれる
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first
        let latitude = location?.coordinate.latitude
        let longitude = location?.coordinate.longitude
        
        print("latitude: \(latitude!)\nlongitude: \(longitude!)")
        label.text = "latitude: \(latitude!)\nlongitude: \(longitude!)"
    }
}

