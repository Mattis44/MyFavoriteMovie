//
//  Untitled.swift
//  MyFavoriteMovie
//
//  Created by Mattis Naud on 04/01/2026.
//

import Foundation
extension TMDBClient {
    func searchMovies(query: String) async throws -> [Movie] {
        guard !query.isEmpty else { return [] }

        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        let path = "/search/movie?query=\(encodedQuery)&language=fr-FR"

        let request = try authorizedRequest(path: path)
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let http = response as? HTTPURLResponse,
              (200...299).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(MovieResponse.self, from: data).results
    }
}
