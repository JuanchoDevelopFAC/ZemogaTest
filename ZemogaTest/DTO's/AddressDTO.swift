//
//  AddressDTO.swift
//  ZemogaTest
//
//  Created by Juan Fernando Alvarez Carvajal on 8/05/22.
//

import Foundation

struct AddressDTO: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: GeoDTO
    
    
    enum CodingKeys: CodingKey {
        case street, suite, city, zipcode, geo
    }
}
