//
//  MockStoryService.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Services/MockStoryService.swift
import Foundation

final class MockStoryService: StoryServiceProtocol {
    func fetchStories() async throws -> [Story] {
        try await Task.sleep(nanoseconds: 400_000_000)
        return [
            Story(id: "1", author: User(id: "u1", username: "alex", avatarName: "avatar1"), imageName: "story1", timestamp: Date()),
            Story(id: "2", author: User(id: "u2", username: "alice",   avatarName: "avatar2"), imageName: "story2", timestamp: Date()),
            Story(id: "3", author: User(id: "u3", username: "bob",   avatarName: "avatar2"), imageName: "story3", timestamp: Date())
        ]
    }

    func fetchStory(id: String) async throws -> Story {
        try await Task.sleep(nanoseconds: 200_000_000)
        return Story(id: id, author: User(id: "u\(id)", username: "user\(id)", avatarName: "avatar\(id)"), imageName: "story\(id)", timestamp: Date())
    }
}
