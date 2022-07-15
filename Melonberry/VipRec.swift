//
//  VipRec.swift
//  Melonberry
//
//  Created by Václav Matoušek on 02.03.2022.
//

import Foundation

struct VipRec: Codable, Equatable, Identifiable {
    var id: String
    var vid: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case vid
    }
    
    init(
        id: String? = "",
        vid: String? = ""
         
    ) {
        self.id = id!
        self.vid = vid!
    }}
