//
//  MockProfileService.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Services/MockProfileService.swift
import Foundation

final class MockProfileService: ProfileServiceProtocol {
    func fetchProfile(userID: String) async throws -> Profile {
        try await Task.sleep(nanoseconds: 300_000_000)
        return Profile(
            id: userID,
            name: "Alex \(userID)",
            avatarName: "profileAvatar",
            bio: "Описание пользователя \(userID)."
        )
    }

    func fetchProfilePosts(userID: String) async throws -> [ProfilePost] {
        try await Task.sleep(nanoseconds: 400_000_000)
        return (1...6).map { i in
            ProfilePost(
                id: "\(i)",
                imageName: "profilePost\(i)",
                caption: nil,
                likes: 0,
                commentsCount: 0
            )
        }
    }
}
