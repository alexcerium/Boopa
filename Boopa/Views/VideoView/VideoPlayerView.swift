//
//  VideoPlayerView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let player: AVPlayer
    let video: VideoItem
    let onComment: () -> Void

    @State private var isLiked = false
    @State private var showComments = false
    @State private var loopObserver: Any? = nil

    var body: some View {
        ZStack {
            PlayerContainerView(player: player)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            VStack {
                Spacer()
                HStack {
                    Image("profileAvatar")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 2) {
                        Text("User \(video.id)")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("Description for video \(video.id)")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    Spacer()
                    VStack(spacing: 24) {
                        ActionButton(systemName: "heart", isActive: $isLiked) {}
                        ActionButton(systemName: "bubble.right", action: { showComments = true })
                    }
                }
                .padding()
                .padding(.bottom, 80)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            // Добавляем observer для зацикливания
            if loopObserver == nil {
                let item = player.currentItem
                loopObserver = NotificationCenter.default.addObserver(
                    forName: .AVPlayerItemDidPlayToEndTime,
                    object: item,
                    queue: .main
                ) { _ in
                    player.seek(to: .zero)
                    player.play()
                }
            }
            player.play()
        }
        .onDisappear {
            player.pause()
            // Удаляем только свой observer
            if let obs = loopObserver {
                NotificationCenter.default.removeObserver(obs)
                loopObserver = nil
            }
        }
        .sheet(isPresented: $showComments) { CommentsView(video: video) }
    }
}
