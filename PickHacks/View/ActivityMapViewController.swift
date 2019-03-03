//
//  ActivityMapViewController.swift
//  PickHacks
//
//  Created by Oti Oritsejafor on 3/2/19.
//  Copyright © 2019 Magloboid. All rights reserved.
//

import Foundation
import SCSDKCreativeKit
import CoreLocation

import Mapbox

class ActivityMapViewController: UIViewController, MGLMapViewDelegate {
    
    let locationManager = CLLocationManager()
    var coordinates = CLLocationCoordinate2D()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ActivityMapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
}
