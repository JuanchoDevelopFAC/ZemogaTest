//
//  GeoDTO.swift
//  ZemogaTest
//
//  Created by Juan Fernando Alvarez Carvajal on 8/05/22.
//

import Foundation

struct GeoDTO: Decodable {
    let lat: String
    let lng: String
    
    enum CodingKeys: CodingKey {
        case lat, lng
    }
}
