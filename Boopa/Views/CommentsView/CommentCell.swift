//
//  CommentCell.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/CommentCell.swift
import SwiftUI

struct CommentCell: View {
    let comment: Comment

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(comment.author.avatarName)
                .resizable()
                .scaledToFill()
                .frame(width: 32, height: 32)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 4) {
                Text(comment.author.username)
                    .font(.subheadline).bold()
                Text(comment.text)
                    .font(.body)
            }
            Spacer()
        }
        .padding(.vertical, 4)
    }
}
