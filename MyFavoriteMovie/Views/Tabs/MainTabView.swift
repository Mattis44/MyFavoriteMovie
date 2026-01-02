import SwiftUI

//
//  MainTabView.swift
//  MyFavoriteMovie
//
//  Created by Mattis Naud on 01/01/2026.
//

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("Movies")
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
            
            Text("Favorites")
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            
            SettingsTabView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}
