//
//  StoryServiceProtocol.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Services/StoryServiceProtocol.swift
import Foundation

protocol StoryServiceProtocol {
    func fetchStories() async throws -> [Story]
    func fetchStory(id: String) async throws -> Story
}
