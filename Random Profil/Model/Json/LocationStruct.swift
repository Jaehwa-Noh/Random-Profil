//
//  LocationStruct.swift
//  Random Profil
//
//  Created by Jaehwa Noh on 2023/03/31.
//

import Foundation

struct LocationStruct: Decodable {
    
    let street: StreetStruct
    let city: String
    let state: String
    let country: String
    let postcode: PostalMultiType
    let coordinates: CoordinatorStruct
    let timezone: TimeZoneStruct
    
}

struct StreetStruct: Decodable {
    let number: Int
    let name: String
    
}

struct CoordinatorStruct: Decodable {
    let latitude: String
    let longitude: String
}

struct TimeZoneStruct: Decodable {
    let offset: String
    let description: String
}
