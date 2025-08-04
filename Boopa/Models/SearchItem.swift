//
//  SearchItem.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Models/SearchItem.swift
import Foundation

struct SearchItem: Identifiable, Codable {
    let id: String
    let mediaName: String
    let isVideo: Bool
}
