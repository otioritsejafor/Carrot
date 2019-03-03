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

import MapboxGeocoder
import Mapbox

class ActivityMapViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    var coordinates = CLLocationCoordinate2D()
    var mapView: MGLMapView!
    var places: Places!
    var activity: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//<<<<<<< HEAD
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
        
//        addAnnotation(coord: st_coord, location: "Missouri S&T Soccer Field rolla", time: "5:00 - 6:00 PM")
//        addAnnotation(coord: lion_coord, location: "Lion Club Soccer Complex", time: "4:00 - 5:30 PM")
        
        
        
        view.addSubview(mapView)
//=======
//>>>>>>> Snapkit
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getPlaces()
        
    }
    
    func addAnnotation(coord: CLLocationCoordinate2D, location: String, time: String) {
        let annotation = MGLPointAnnotation()
        annotation.coordinate = coord
        annotation.title = location
        annotation.subtitle = time
        
        mapView.addAnnotation(annotation)
        
    }
    
    func addAnnotation(coord: [Double], location: String, time: String) {
        let annotation = MGLPointAnnotation()
        let long = coord[0]
        let lat = coord[1]
        let next = CLLocationCoordinate2D(latitude: lat, longitude: long)
        annotation.coordinate = next
        annotation.title = location
        annotation.subtitle = time
        
        mapView.addAnnotation(annotation)
        
        print(annotation.coordinate)
        
    }
    
    @IBAction func back(_ Sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getPlaces() {
        MapBoxClient.getActivityPlaces(activity: activity, long: coordinates.longitude, lat: coordinates.latitude) { (result, error) in
            self.places = result
            print(self.places.features[0].geometry.coordinates)
//            self.addAnnotation(coord: self.places.features[0].geometry.coordinates, location: self.places.features[0].placeName, time: "5:00 - 6:00 PM")
            
            for place in self.places.features {
                self.addAnnotation(coord: place.geometry.coordinates, location: place.text, time: "5:00 - 6:00 PM")
            }
        }
        
       
        
//        MapBoxClient.getBBall(long: coordinates.longitude, lat: coordinates.latitude) { (result, error) in
//            self.places = result
//            print(self.places[0])
//        }
    }
}

extension ActivityMapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        //print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
}

extension ActivityMapViewController: MGLMapViewDelegate {
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }

    
    func mapView(_ mapView: MGLMapView, rightCalloutAccessoryViewFor annotation: MGLAnnotation) -> UIView? {
        return UIButton(type: .detailDisclosure)
    }
}
