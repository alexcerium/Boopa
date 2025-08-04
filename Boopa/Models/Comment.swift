//
//  Comment.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Models/Comment.swift
import Foundation

struct Comment: Identifiable, Codable {
    let id: String
    let author: User
    let text: String
    let timestamp: Date
}
