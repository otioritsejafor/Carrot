//
//  Place.swift
//  PickHacks
//
//  Created by Oti Oritsejafor on 3/2/19.
//  Copyright © 2019 Magloboid. All rights reserved.
//

import Foundation




struct Places: Codable {
    let type: String
    let query: [String]
    let features: [Feature]
    let attribution: String
}

struct Feature: Codable {
    let id, type: String
    let placeType: [String]
    let relevance: Int
    let properties: Properties
    let text, placeName: String
    let matchingText, matchingPlaceName: String?
    let center: [Double]
    let geometry: Geometry
    let context: [Context]
    
    enum CodingKeys: String, CodingKey {
        case id, type
        case placeType = "place_type"
        case relevance, properties, text
        case placeName = "place_name"
        case matchingText = "matching_text"
        case matchingPlaceName = "matching_place_name"
        case center, geometry, context
    }
}

struct Context: Codable {
    let id, text: String
    let wikidata: String?
    let shortCode: ShortCode?
    
    enum CodingKeys: String, CodingKey {
        case id, text, wikidata
        case shortCode = "short_code"
    }
}

enum ShortCode: String, Codable {
    case us = "us"
    case usMo = "US-MO"
}

struct Geometry: Codable {
    let coordinates: [Double]
    let type: String
}

struct Properties: Codable {
    let landmark: Bool
    let category: String
    let address: String?
}
