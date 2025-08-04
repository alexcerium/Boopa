//
//  PlayerContainerView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/PlayerContainerView.swift
import SwiftUI
import AVKit

struct PlayerContainerView: UIViewControllerRepresentable {
    let player: AVPlayer

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let vc = AVPlayerViewController()
        vc.player = player
        vc.showsPlaybackControls = false
        vc.videoGravity = .resizeAspectFill
        return vc
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        uiViewController.player = player
    }
}
