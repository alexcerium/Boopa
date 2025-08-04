//
//  CommentsView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/CommentsView.swift
// Views/CommentsView.swift
import SwiftUI

struct CommentsView: View {
    let video: VideoItem
    @State private var comments: [Comment] = []
    @State private var isLoading = true
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Group {
                if isLoading {
                    CommentsSkeletonView()
                } else {
                    List(comments) { comment in
                        CommentCell(comment: comment)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Comments")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") { dismiss() }
                }
            }
            .task {
                try? await Task.sleep(nanoseconds: 500_000_000)
                comments = [
                    Comment(id: "1", author: commentAuthor, text: "Great video!", timestamp: Date()),
                    Comment(id: "2", author: commentAuthor, text: "Love this.", timestamp: Date())
                ]
                isLoading = false
            }
        }
    }

    private var commentAuthor: User {
        User(id: "u0", username: "user", avatarName: "avatar1")
    }
}
