//
//  ProfileButtonRowView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/ProfileButtonRowView.swift
import SwiftUI

private struct ProfileAction: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let gradient: LinearGradient
}

struct ProfileButtonRowView: View {
    private let actions: [ProfileAction] = [
        .init(
            title: "Друзья",
            icon: "person.2.fill",
            gradient: LinearGradient(
                gradient: Gradient(colors: [Color.purple, Color.pink]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        ),
        .init(
            title: "Сообщества",
            icon: "person.3.fill",
            gradient: LinearGradient(
                gradient: Gradient(colors: [Color.orange, Color.yellow]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        ),
        .init(
            title: "Закладки",
            icon: "bookmark.fill",
            gradient: LinearGradient(
                gradient: Gradient(colors: [Color.red, Color.pink]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        ),
        .init(
            title: "Настройки",
            icon: "gearshape.fill",
            gradient: LinearGradient(
                gradient: Gradient(colors: [Color.gray.opacity(0.7), Color.gray]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    ]

    private let columns = Array(repeating: GridItem(.flexible()), count: 4)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(actions) { action in
                VStack(spacing: 8) {
                    ZStack {
                        Circle()
                            .fill(action.gradient)
                            .frame(width: 50, height: 50)
                        Image(systemName: action.icon)
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.white)
                    }
                    Text(action.title)
                        .font(.footnote)
                        .foregroundColor(.primary)
                }
            }
        }
        .padding(.vertical)
    }
}
