//
//  Wp_user.swift
//  Melonberry
//
//  Created by Václav Matoušek on 26.11.2021.
//

import Foundation

struct Wp_user: Codable, Equatable {
    var username: String
    var first_name: String
    var last_name: String
    var email: String
    var roles: String
    var password: String
    
    enum CodingKeys: String, CodingKey {
        case username
        case first_name
        case last_name
        case email
        case roles
        case password
    }
    
    init(username: String? = "",
         first_name: String? = "",
         last_name: String? = "",
         email: String? = "",
         roles: String? = "",
         password: String? = "") {
        
        self.username = username!
        self.first_name = first_name!
        self.last_name = last_name!
        self.email = email!
        self.roles = roles!
        self.password = password!
        
    }
}
