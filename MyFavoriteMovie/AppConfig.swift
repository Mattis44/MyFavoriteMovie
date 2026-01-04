import Foundation

enum AppConfig {
    static let tmdbApiKey: String = {
        guard let key = Bundle.main.infoDictionary?["TMDB_API_KEY"] as? String else {
            fatalError("TMDB_API_KEY missing")
        }
        return key
    }()
}
