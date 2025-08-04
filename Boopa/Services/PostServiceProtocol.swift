//
//  PostServiceProtocol.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Services/PostServiceProtocol.swift
import Foundation

protocol PostServiceProtocol {
    func fetchPosts() async throws -> [Post]
    func fetchPost(id: String) async throws -> Post
}
