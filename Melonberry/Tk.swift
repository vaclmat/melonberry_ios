//
//  Tk.swift
//  Melonberry
//
//  Created by Václav Matoušek on 02.12.2021.
//

import Foundation

struct Tk: Codable {
    let success: Bool
    let statusCode: Int
    let code: String
    let message: String
    let data: Datastruc
}
