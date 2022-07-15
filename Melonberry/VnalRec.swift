//
//  VnalRec.swift
//  Melonberry
//
//  Created by Václav Matoušek on 02.03.2022.
//

import Foundation

struct VnalRec: Codable, Equatable, Identifiable {
    var id: String
    var videoname: String
    var linktv: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case videoname
        case linktv
    }
    
    init(
        id: String? = "",
        videoname: String? = "",
        linktv: String? = ""
         
    ) {
        self.id = id!
        self.videoname = videoname!
        self.linktv = linktv!
    }}
