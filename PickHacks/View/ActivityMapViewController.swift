//
//  ActivityMapViewController.swift
//  PickHacks
//
//  Created by Oti Oritsejafor on 3/2/19.
//  Copyright © 2019 Magloboid. All rights reserved.
//

import Foundation

import Mapbox

class ActivityMapViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    var coordinates = CLLocationCoordinate2D()
    var mapView: MGLMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        coordinates = (locationManager.location?.coordinate)!
        
        let current_loc = MGLPointAnnotation()
        current_loc.coordinate = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
        current_loc.title = "You"
        
        
        let url = URL(string: "mapbox://styles/mapbox/streets-v11")
        mapView = MGLMapView(frame: view.bounds, styleURL: url)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude), zoomLevel: 14, animated: false)
        
        mapView.delegate = self
        mapView.addAnnotation(current_loc)
        let st_coord = CLLocationCoordinate2D(latitude: 37.95146, longitude: -91.770519)
        let lion_coord = CLLocationCoordinate2D(latitude: 37.929820, longitude: -91.739820)
        
        addAnnotation(coord: st_coord, location: "Missouri S&T Soccer Field rolla", time: "5:00 - 6:00 PM")
        addAnnotation(coord: lion_coord, location: "Lion Club Soccer Complex", time: "4:00 - 5:30 PM")
        
        view.addSubview(mapView)
    }
    
    func addAnnotation(coord: CLLocationCoordinate2D, location: String, time: String) {
        let annotation = MGLPointAnnotation()
        annotation.coordinate = coord
        annotation.title = location
        annotation.subtitle = time
        
        mapView.addAnnotation(annotation)
        
    }
}

extension ActivityMapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
}

extension ActivityMapViewController: MGLMapViewDelegate {
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
    
//    func mapView(_ mapView: MGLMapView, leftCalloutAccessoryViewFor annotation: MGLAnnotation) -> UIView? {
//
//            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 50))
//            label.textAlignment = .right
//            label.textColor = UIColor(red: 0.81, green: 0.71, blue: 0.23, alpha: 1)
//            //label.text = "金閣寺"
//
//            return label
//
//    }
    
    func mapView(_ mapView: MGLMapView, rightCalloutAccessoryViewFor annotation: MGLAnnotation) -> UIView? {
        return UIButton(type: .detailDisclosure)
    }
}
