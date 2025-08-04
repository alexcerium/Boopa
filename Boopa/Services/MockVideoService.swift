//
//  MockVideoService.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Services/MockVideoService.swift
import Foundation

final class MockVideoService: VideoServiceProtocol {
    func fetchVideos() async throws -> [VideoItem] {
        try await Task.sleep(nanoseconds: 500_000_000)
        return (1...5).map { i in
            VideoItem(id: "\(i)", resourceName: "video\(i)")
        }
    }

    func fetchVideo(id: String) async throws -> VideoItem {
        try await Task.sleep(nanoseconds: 300_000_000)
        return VideoItem(id: id, resourceName: "video\(id)")
    }
}

