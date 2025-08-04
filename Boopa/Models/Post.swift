//
//  Post.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Models/Post.swift
import Foundation

struct Post: Identifiable, Codable {
    let id: String
    let author: User
    let imageName: String?
    let caption: String?
    let timestamp: Date
}
