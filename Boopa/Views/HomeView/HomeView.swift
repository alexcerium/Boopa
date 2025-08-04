//
//  HomeView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/HomeView.swift
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedIndex: Int?

    private var isStoryPresented: Binding<Bool> {
        Binding(
            get: { selectedIndex != nil },
            set: { newValue in
                if !newValue { selectedIndex = nil }
            }
        )
    }

    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.isLoading {
                    StorySkeletonView()
                    VStack(spacing: 16) {
                        ForEach(0..<6) { _ in PostSkeletonView() }
                    }
                    .padding(.top)
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(Array(viewModel.stories.prefix(4).enumerated()), id: \.element.id) { idx, story in
                                StoryView(story: story)
                                    .onTapGesture { selectedIndex = idx }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top)
                    .fullScreenCover(isPresented: isStoryPresented) {
                        StoryPagerView(
                            stories: Array(viewModel.stories.prefix(4)),
                            startIndex: selectedIndex ?? 0
                        )
                    }
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.posts.prefix(6)) { post in
                            PostCell(post: post)
                        }
                    }
                    .padding(.horizontal, 0)
                }
            }
            .navigationTitle("Boopa")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: MessagesView()) {
                        Image(systemName: "message")
                    }
                    NavigationLink(destination: NotificationsView()) {
                        Image(systemName: "bell")
                    }
                }
            }
        }
    }
}
