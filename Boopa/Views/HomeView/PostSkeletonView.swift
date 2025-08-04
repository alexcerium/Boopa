//
//  PostSkeletonView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/PostSkeletonView.swift
import SwiftUI

struct PostSkeletonView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 40, height: 40)
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 20)
                    .cornerRadius(4)
                Spacer()
            }
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 200)
                .cornerRadius(4)
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 16)
                .cornerRadius(4)
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 120, height: 16)
                .cornerRadius(4)
        }
    }
}
