//
//  PostCell.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/PostCell.swift
// Views/PostCell.swift
import SwiftUI

struct PostCell: View {
    let post: Post
    @State private var isLiked = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(post.author.avatarName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text(post.author.username)
                    .font(.headline)
                Spacer()
            }
            Image(post.imageName ?? "")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
                .clipped()
            Text(post.caption ?? "")
                .font(.body)
            HStack(spacing: 24) {
                ActionButton(systemName: "heart", isActive: $isLiked) { /* like action */ }
                ActionButton(systemName: "bubble.right", action: { /* comment action */ })
                ActionButton(systemName: "paperplane", action: { /* share action */ })
                Spacer()
                ActionButton(systemName: "bookmark", action: { /* save action */ })
            }
            .padding(.vertical, 4)
            .foregroundColor(.primary)
        }
    }
}
