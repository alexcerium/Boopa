//
//  Story.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Models/Story.swift
import Foundation

struct Story: Identifiable, Codable {
    let id: String
    let author: User
    let imageName: String
    let timestamp: Date
}
