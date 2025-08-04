//
//  ProfileGridView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/ProfileGridView.swift
import SwiftUI

struct ProfileGridView: View {
    let items: [ProfilePost]
    private let columns = 3
    private let spacing: CGFloat = 1

    var body: some View {
        let totalSpacing = spacing * CGFloat(columns - 1)
        let itemWidth = (UIScreen.main.bounds.width - totalSpacing) / CGFloat(columns)

        HStack(alignment: .top, spacing: spacing) {
            ForEach(0..<columns, id: \.self) { column in
                VStack(spacing: spacing) {
                    ForEach(columnItems(column)) { post in
                        Image(post.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: itemWidth, height: itemWidth)
                            .clipped()
                    }
                }
            }
        }
    }

    private func columnItems(_ column: Int) -> [ProfilePost] {
        items.enumerated()
             .filter { $0.offset % columns == column }
             .map { $0.element }
    }
}
