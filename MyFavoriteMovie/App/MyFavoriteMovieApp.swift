//
//  MyFavoriteMovieApp.swift
//  MyFavoriteMovie
//
//  Created by Mattis Naud on 01/01/2026.
//

import SwiftUI

@main
struct MyFavoriteMovieApp: App {
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .environmentObject(authViewModel)
    }
}

#Preview {
    let authViewModel = AuthViewModel()
    authViewModel.isAuthenticated = true
    
    return RootView().environmentObject(authViewModel)
}
