//
//  ReelsViewModel.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// ViewModels/ReelsViewModel.swift
import Foundation
import AVKit
import SwiftUI
import Combine

@MainActor
final class ReelsViewModel: ObservableObject {
    @Published var videos: [VideoItem] = []
    @Published var isLoading = false

    private let videoService: VideoServiceProtocol
    private var players: [Int: AVPlayer] = [:]

    init(videoService: VideoServiceProtocol = MockVideoService()) {
        self.videoService = videoService
        Task { await loadVideos() }
    }

    func loadVideos() async {
        isLoading = true
        do {
            videos = try await videoService.fetchVideos()
            setupPlayers(for: 0)
        } catch {
            // handle error
        }
        isLoading = false
    }

    func setupPlayers(for index: Int) {
        guard videos.indices.contains(index) else { return }
        // кэшируем текущий и соседние индексы
        let indicesToCache = [index] + [index - 1, index + 1].filter { videos.indices.contains($0) }
        for i in indicesToCache {
            if players[i] != nil { continue }
            guard let url = Bundle.main.url(
                forResource: videos[i].resourceName, withExtension: "mp4"
            ) else { continue }
            let item = AVPlayerItem(url: url)
            let player = AVPlayer(playerItem: item)
            player.actionAtItemEnd = .none
            NotificationCenter.default.addObserver(
                forName: .AVPlayerItemDidPlayToEndTime,
                object: item,
                queue: .main
            ) { _ in
                player.seek(to: .zero)
                player.play()
            }
            players[i] = player
        }
        // освобождаем неиспользуемые плееры
        let validKeys = Set(indicesToCache)
        for key in players.keys where !validKeys.contains(key) {
            players[key]?.pause()
            players[key] = nil
        }
    }

    func player(for index: Int) -> AVPlayer? {
        players[index]
    }
}
