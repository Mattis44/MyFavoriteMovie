import Supabase
import Foundation

//
//  SupabaseClient.swift
//  MyFavoriteMovie
//
//  Created by Mattis Naud on 01/01/2026.
//

final class SupabaseManager {
    static let shared = SupabaseManager()
    
    let client: SupabaseClient
    
    private init() {
        client = SupabaseClient(
            supabaseURL: URL(string: "https://ybnpptafolhpyaedhqyi.supabase.co")!,
            supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlibnBwdGFmb2xocHlhZWRocXlpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjcyNzExNjUsImV4cCI6MjA4Mjg0NzE2NX0.gS6ZpVypM1Lfn73hD4TeLauseCBcM-cDbg8FFLZSGxo"
        )
    }
}
