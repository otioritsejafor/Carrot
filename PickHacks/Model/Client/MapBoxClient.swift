//
//  MapBoxClient.swift
//  PickHacks
//
//  Created by Oti Oritsejafor on 3/2/19.
//  Copyright © 2019 Magloboid. All rights reserved.
//

import Foundation
import MapboxGeocoder
import Mapbox

class MapBoxClient: Client {
    static var geocoder = Geocoder.shared
    
    enum Endpoints {
        static let base = "https://api.mapbox.com"
        static let geocode = "/geocoding/v5/mapbox.places/"
        static let apiKeyParam = "access_token=pk.eyJ1Ijoib3Rpb3JpdHNlamFmb3IiLCJhIjoiY2pxam9nMnM5NmRyMjQzcGRhZGhzcTh5YSJ9.ZgsnnbhE7tTbKgZ8gb-f_w"
        
        case getPOI(String, CLLocationDegrees, CLLocationDegrees)
        
        case getCall(CLLocationDegrees, CLLocationDegrees)
        
        var stringValue: String {
            switch self {
            case .getPOI(let activity, let long, let lat):
                return Endpoints.base + Endpoints.geocode + activity + ".json?" + "proximity=\(long)" + ",\(lat)" +  "&" + Endpoints.apiKeyParam
                
            case .getCall(let long, let lat):
                return "https://api.mapbox.com/geocoding/v5/mapbox.places/basketball.json?proximity=-91.77603529999999,37.9545621&type=poi&access_token=pk.eyJ1Ijoib3Rpb3JpdHNlamFmb3IiLCJhIjoiY2pxam9nMnM5NmRyMjQzcGRhZGhzcTh5YSJ9.ZgsnnbhE7tTbKgZ8gb-f_w"
                
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    class func getActivityPlaces(activity: String, long: CLLocationDegrees, lat: CLLocationDegrees, completion: @escaping (Places, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.getPOI(activity, long, lat).url, response: Places.self) { (response, error) in
            if let response = response {
                print("Success")
                completion(response, nil)
            } else {
                print("Failure")
                //completion(nil, error)
            }
        }
    }
    
    
    
    
   
}
