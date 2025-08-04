//
//  SearchViewModel.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// ViewModels/SearchViewModel.swift
import Foundation
import Combine

@MainActor
final class SearchViewModel: ObservableObject {
    @Published var results: [SearchItem] = []
    @Published var isLoading = false

    private let searchService: SearchServiceProtocol

    init(searchService: SearchServiceProtocol = MockSearchService()) {
        self.searchService = searchService
        Task { await loadInitial() }
    }

    func loadInitial() async {
        await search(query: "")
    }

    func search(query: String) async {
        isLoading = true
        do {
            results = try await searchService.search(query: query)
        } catch {
            results = []
        }
        isLoading = false
    }
}
