//
//  SearchServiceProtocol.swift
//  Boopa
//
//  Created by Aleksandr on 27.06.2025.
//

// Services/SearchServiceProtocol.swift
import Foundation

protocol SearchServiceProtocol {
    func search(query: String) async throws -> [SearchItem]
}
