//
//  MockPostService.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Services/MockPostService.swift
import Foundation

final class MockPostService: PostServiceProtocol {
    func fetchPosts() async throws -> [Post] {
        try await Task.sleep(nanoseconds: 500_000_000)
        return [
            Post(id: "1", author: User(id: "u1", username: "alex", avatarName: "avatar1"), imageName: "post1", caption: "Пост 1", timestamp: Date()),
            Post(id: "2", author: User(id: "u2", username: "alice",   avatarName: "avatar2"), imageName: "post2", caption: "Пост 2", timestamp: Date()),
            Post(id: "3", author: User(id: "u3", username: "bob",   avatarName: "avatar3"), imageName: "post3", caption: "Пост 3", timestamp: Date()),
            Post(id: "4", author: User(id: "u1", username: "alex",   avatarName: "avatar1"), imageName: "post4", caption: "Пост 4", timestamp: Date()),
            Post(id: "5", author: User(id: "u2", username: "alice",   avatarName: "avatar2"), imageName: "post5", caption: "Пост 5", timestamp: Date()),
            Post(id: "6", author: User(id: "u3", username: "bob",   avatarName: "avatar3"), imageName: "post6", caption: "Пост 6", timestamp: Date())
        ]
    }

    func fetchPost(id: String) async throws -> Post {
        try await Task.sleep(nanoseconds: 300_000_000)
        return Post(id: id, author: User(id: "u\(id)", username: "user\(id)", avatarName: "avatar\(id)"), imageName: "post\(id)", caption: "Mock post \(id)", timestamp: Date())
    }
}
