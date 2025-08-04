//
//  MasonryGrid.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/MasonryGrid.swift
import SwiftUI

struct MasonryGrid<Item: Identifiable, Content: View>: View {
    let items: [Item]
    let columns: Int
    let content: (Item) -> Content

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            ForEach(0..<columns, id: \.self) { column in
                VStack(spacing: 8) {
                    ForEach(columnItems(column)) { item in
                        content(item)
                    }
                }
            }
        }
        .padding(.horizontal, 8)
    }

    private func columnItems(_ column: Int) -> [Item] {
        items.enumerated()
             .filter { $0.offset % columns == column }
             .map { $0.element }
    }
}
