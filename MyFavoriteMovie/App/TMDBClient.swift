import SwiftUI

//
//  TMDBClient.swift
//  MyFavoriteMovie
//
//  Created by Mattis Naud on 02/01/2026.
//

struct TMDBClient {
    private let apiKey: String = {
        guard let value = Bundle.main.object(forInfoDictionaryKey: "TMDB_API_KEY") as? String,
              !value.isEmpty else {
            assertionFailure("TMDB_API_KEY is missing from Info.plist or is empty. Ensure Info.plist contains TMDB_API_KEY = $(TMDB_API_KEY) and Secrets.xcconfig is applied to the target.")
            return ""
        }
        return value
    }()
}
