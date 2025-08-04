//
//  VideoServiceProtocol.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Services/VideoServiceProtocol.swift
import Foundation

protocol VideoServiceProtocol {
    func fetchVideos() async throws -> [VideoItem]
    func fetchVideo(id: String) async throws -> VideoItem
}
