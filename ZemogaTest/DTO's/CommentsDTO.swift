//
//  CommentsDTO.swift
//  ZemogaTest
//
//  Created by Juan Fernando Alvarez Carvajal on 8/05/22.
//

import Foundation

struct CommentsDTO: Decodable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
    
    enum CodingKeys: CodingKey {
        case postId, id, name, email, body
    }
}
