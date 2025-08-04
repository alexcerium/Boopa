//
//  ProfileViewModel.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// ViewModels/ProfileViewModel.swift
import Foundation
import Combine

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var profile: Profile?
    @Published var posts: [ProfilePost] = []
    @Published var isLoading = false

    private let profileService: ProfileServiceProtocol
    private let userID: String

    init(
        userID: String,
        profileService: ProfileServiceProtocol = MockProfileService()
    ) {
        self.userID = userID
        self.profileService = profileService
        Task { await loadProfile() }
    }

    func loadProfile() async {
        isLoading = true
        do {
            let p = try await profileService.fetchProfile(userID: userID)
            let pp = try await profileService.fetchProfilePosts(userID: userID)
            profile = p
            posts = pp
        } catch {
            // handle error
        }
        isLoading = false
    }
}
