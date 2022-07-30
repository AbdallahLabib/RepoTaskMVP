//
//  Repository.swift
//  RepoTaskMVP
//
//  Created by user225645 on 7/25/22.
//

import Foundation

struct Repository: Decodable {
    let repositoryName: String
    let owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case repositoryName = "name"
        case owner
    }
}

struct Owner: Decodable {
    let imagePath: String
    
    enum CodingKeys: String, CodingKey {
        case imagePath = "avatar_url"
    }
    
}
