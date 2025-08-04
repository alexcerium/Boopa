//
//  ProfileServiceProtocol.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Services/ProfileServiceProtocol.swift
import Foundation

protocol ProfileServiceProtocol {
    func fetchProfile(userID: String) async throws -> Profile
    func fetchProfilePosts(userID: String) async throws -> [ProfilePost]
}
