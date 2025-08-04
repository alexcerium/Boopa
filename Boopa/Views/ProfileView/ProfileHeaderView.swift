//
//  ProfileHeaderView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/ProfileHeaderView.swift
import SwiftUI

struct ProfileHeaderView: View {
    let profile: Profile

    var body: some View {
        VStack(spacing: 8) {
            Image(profile.avatarName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())

            Text(profile.name)
                .font(.title2).bold()
            if let bio = profile.bio {
                Text(bio)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
    }
}
