//
//  SearchSkeletonView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/SearchSkeletonView.swift
import SwiftUI

struct SearchSkeletonView: View {
    private let items = Array(1...12)
    private let columns = 2

    var body: some View {
        ScrollView {
            HStack(alignment: .top, spacing: 8) {
                ForEach(0..<columns, id: \.self) { column in
                    VStack(spacing: 8) {
                        ForEach(columnItems(column), id: \.self) { index in
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: height(for: index))
                                .cornerRadius(8)
                        }
                    }
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 8)
        }
    }

    private func columnItems(_ column: Int) -> [Int] {
        items.enumerated()
             .filter { $0.offset % columns == column }
             .map { $0.element }
    }

    private func height(for index: Int) -> CGFloat {
        index % 3 == 0 ? 200 : 150
    }
}
