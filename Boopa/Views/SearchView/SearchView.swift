//
//  SearchView.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Views/SearchView.swift
import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var searchText = ""

    var body: some View {
        VStack(spacing: 0) {
            SearchBarView(text: $searchText)
                .padding(.top, 16)
                .onChange(of: searchText) { newValue in
                    Task { await viewModel.search(query: newValue) }
                }

            if viewModel.isLoading {
                SearchSkeletonView()
            } else {
                ScrollView {
                    MasonryGrid(items: viewModel.results, columns: 2) { item in
                        ZStack(alignment: .center) {
                            let width = (UIScreen.main.bounds.width - 32) / 2
                            let height: CGFloat = (Int(item.id) ?? 0) % 3 == 0 ? 200 : 150
                            Image(item.mediaName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: width, height: height)
                                .clipped()
                                .cornerRadius(8)
                            if item.isVideo {
                                Image(systemName: "play.circle.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white.opacity(0.8))
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
        }
        .navigationTitle("Поиск")
    }
}
