//
//  UserDetails.swift
//  socialApp-Pepul (iOS)
//
//  Created by ramanathan.vadivel on 07/07/22.
//

import Foundation

struct UserDetails: Codable {
    var statusCode: Int?
    var message: String?
    var data: [Post]
}

struct Post: Codable, Identifiable, Equatable {
    var id: String?
    var file: String?
    var file_type: String?
}


