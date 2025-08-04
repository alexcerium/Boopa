//
//  MockSearchService.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Services/MockSearchService.swift
import Foundation

final class MockSearchService: SearchServiceProtocol {
    func search(query: String) async throws -> [SearchItem] {
        try await Task.sleep(nanoseconds: 300_000_000)
        // return 12 mock items
        return (1...12).map { i in
            SearchItem(
                id: "\(i)",
                mediaName: "search\(i)",
                isVideo: i % 3 == 0
            )
        }
    }
}
