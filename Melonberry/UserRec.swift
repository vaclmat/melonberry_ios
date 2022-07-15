//
//  UserRec.swift
//  Melonberry
//
//  Created by Václav Matoušek on 09.12.2021.
//

import Foundation

struct UserRec: Codable, Equatable {
    let id: Int
    var name: String
    let url: String
    let description: String
    let link: String
    var slug: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case url
        case description
        case link
        case slug
    }
    
    init(id: Int? = 0,
         name: String? = "",
         url: String? = "",
         description: String? = "",
         link: String? = "",
         slug: String? = ""
    ) {
        
        self.id = id!
        self.name = name!
        self.url = url!
        self.description = description!
        self.link = link!
        self.slug = slug!
    }}
