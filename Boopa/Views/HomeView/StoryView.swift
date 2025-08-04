//
//  StoryView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/StoryView.swift
import SwiftUI

struct StoryView: View {
    let story: Story
    private let size: CGFloat = 90

    var body: some View {
        Image(story.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [.red, .orange, .purple]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 4
                    )
            )
            .shadow(radius: 2)
    }
}
