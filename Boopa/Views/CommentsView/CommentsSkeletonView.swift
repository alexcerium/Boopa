//
//  CommentsSkeletonView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/CommentsSkeletonView.swift
import SwiftUI

struct CommentsSkeletonView: View {
    var body: some View {
        VStack(spacing: 16) {
            ForEach(0..<5) { _ in
                HStack(spacing: 8) {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 32, height: 32)
                    VStack(alignment: .leading, spacing: 8) {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 16)
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 150, height: 16)
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }
}
