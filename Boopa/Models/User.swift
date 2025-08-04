//
//  User.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Models/User.swift
import Foundation

struct User: Identifiable, Codable {
    let id: String
    let username: String
    let avatarName: String
}
