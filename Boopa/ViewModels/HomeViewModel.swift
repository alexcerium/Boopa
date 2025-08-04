//
//  HomeViewModel.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// ViewModels/HomeViewModel.swift
import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var stories: [Story] = []
    @Published var isLoading = false

    private let postService: PostServiceProtocol
    private let storyService: StoryServiceProtocol

    init(
        postService: PostServiceProtocol = MockPostService(),
        storyService: StoryServiceProtocol = MockStoryService()
    ) {
        self.postService = postService
        self.storyService = storyService
        Task { await loadContent() }
    }

    func loadContent() async {
        isLoading = true
        async let fetchedPosts = postService.fetchPosts()
        async let fetchedStories = storyService.fetchStories()
        do {
            posts = try await fetchedPosts
            stories = try await fetchedStories
        } catch {
            // handle error
        }
        isLoading = false
    }
}
