//
//  CompanyDTO.swift
//  ZemogaTest
//
//  Created by Juan Fernando Alvarez Carvajal on 8/05/22.
//

import Foundation

struct CompanyDTO: Decodable {
    let name: String
    let catchPhrase: String
    let bs: String
    
    enum CodingKeys: CodingKey {
        case name, catchPhrase, bs
    }
}
