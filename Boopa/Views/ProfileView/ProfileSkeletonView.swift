//
//  ProfileSkeletonView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/ProfileSkeletonView.swift
import SwiftUI

struct ProfileSkeletonView: View {
    var body: some View {
        VStack(spacing: 16) {
            // Header skeleton
            VStack(spacing: 8) {
                Circle().fill(Color.gray.opacity(0.3)).frame(width: 100, height: 100)
                Rectangle().fill(Color.gray.opacity(0.3)).frame(width: 120, height: 20)
                Rectangle().fill(Color.gray.opacity(0.3)).frame(width: 180, height: 16)
            }
            // Buttons skeleton
            HStack(spacing: 12) {
                ForEach(0..<4) { _ in
                    Rectangle().fill(Color.gray.opacity(0.3)).frame(width: 80, height: 30).cornerRadius(8)
                }
            }
            // Grid skeleton
            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())], spacing: 2) {
                ForEach(0..<9) { _ in
                    Rectangle().fill(Color.gray.opacity(0.3)).frame(height: 100)
                }
            }
        }
        .padding(.horizontal)
    }
}
