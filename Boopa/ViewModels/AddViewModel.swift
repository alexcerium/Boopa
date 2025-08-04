//
//  AddViewModel.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// ViewModels/AddViewModel.swift
import Foundation
import Combine

@MainActor
final class AddViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var uploadSuccess = false

    private let postService: PostServiceProtocol

    init(postService: PostServiceProtocol = MockPostService()) {
        self.postService = postService
    }

    func uploadPost(author: User, imageName: String, caption: String) async {
        isLoading = true
        // simulate network/upload delay
        try? await Task.sleep(nanoseconds: 500_000_000)
        // TODO: integrate actual upload via service when available
        isLoading = false
        uploadSuccess = true
    }
}
