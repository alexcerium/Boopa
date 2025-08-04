//
//  Profile.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Models/Profile.swift
import Foundation

struct Profile: Identifiable, Codable {
    let id: String
    let name: String
    let avatarName: String
    let bio: String?
}
