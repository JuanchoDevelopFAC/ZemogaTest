//
//  PostsDTO.swift
//  ZemogaTest
//
//  Created by Juan Fernando Alvarez Carvajal on 8/05/22.
//

import Foundation

struct PostsDTO: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    enum CodingKeys: CodingKey {
        case userId, id, title, body
    }
}
