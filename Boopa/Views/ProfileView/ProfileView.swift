//
//  ProfileView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/ProfileView.swift
import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel: ProfileViewModel

    init(userID: String) {
        _viewModel = StateObject(wrappedValue: ProfileViewModel(userID: userID))
    }

    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.isLoading {
                    ProfileSkeletonView()
                } else if let profile = viewModel.profile {
                    VStack(spacing: 16) {
                        ProfileHeaderView(profile: profile)
                        ProfileButtonRowView()
                        ProfileGridView(items: viewModel.posts)
                    }
                    .padding(.horizontal)
                } else {
                    Text("Не удалось загрузить профиль")
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Профиль")
        }
    }
}
