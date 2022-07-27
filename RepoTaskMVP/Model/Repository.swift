//
//  Repository.swift
//  RepoTaskMVP
//
//  Created by user225645 on 7/25/22.
//

import Foundation


struct Repository: Codable {
    
    let repositiryName: String?
    let owner: Owner?
    enum CodingKeys: String, CodingKey {
        case repositiryName = "name"
        case owner
    }
}

struct Owner: Codable {
    let ownerImage: String?
    
    enum CodingKeys: String, CodingKey {
        case ownerImage = "avatar_url"
    }
    
}
