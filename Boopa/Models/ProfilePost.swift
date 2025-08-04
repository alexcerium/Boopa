//
//  ProfilePost.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Models/ProfilePost.swift
import Foundation

struct ProfilePost: Identifiable, Codable {
    let id: String
    let imageName: String
    let caption: String?
    let likes: Int
    let commentsCount: Int
}

