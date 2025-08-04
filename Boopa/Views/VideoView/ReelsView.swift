//
//  ReelsView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// ReelsView.swift
// Boopa

import SwiftUI

struct ReelsView: View {
    @StateObject private var vm = ReelsViewModel()
    @State private var index = 0
    @GestureState private var dragOffset: CGFloat = 0

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                ForEach(vm.videos.indices, id: \.self) { i in
                    Group {
                        if let player = vm.player(for: i) {
                            VideoPlayerView(player: player,
                                            video: vm.videos[i],
                                            onComment: {})
                        } else {
                            VideoSkeletonView()
                        }
                    }
                    .frame(width: geo.size.width,
                           height: geo.size.height)
                }
            }
            .offset(y: -CGFloat(index) * geo.size.height + dragOffset)
            .animation(.interactiveSpring(response: 0.3,
                                           dampingFraction: 0.7),
                       value: index)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { v, state, _ in
                        state = v.translation.height
                    }
                    .onEnded { v in
                        let threshold: CGFloat = 50
                        let predicted = v.predictedEndTranslation.height
                        withAnimation(.interactiveSpring(response: 0.3,
                                                         dampingFraction: 0.7)) {
                            if predicted < -threshold,
                               index < vm.videos.count - 1 {
                                index += 1
                            } else if predicted > threshold,
                                      index > 0 {
                                index -= 1
                            }
                        }
                    }
            )
        }
        .ignoresSafeArea()
        .onChange(of: index) { newIndex in
            vm.setupPlayers(for: newIndex)
        }
    }
}
