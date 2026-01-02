import SwiftUI

//
//  Profile.swift
//  MyFavoriteMovie
//
//  Created by Mattis Naud on 02/01/2026.
//

struct SettingsTabView: View {
    
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    func handleLogout() async {
        await authViewModel.logout()
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                
                
                NavigationLink {
                    Text("Edit Profile")
                } label: {
                    ProfileHeaderRow(
                        email: "example@test.com",
                        subtitle: "My account",
                        avatarURL: nil
                    )
                }
                NavigationLink {
                    Text("Change Password")
                } label: {
                    Label("Change Password", systemImage: "lock.fill")
                }
                
                
                Section("Preferences") {
                    NavigationLink {
                        Text("Theme")
                    } label: {
                        Label("Theme", systemImage: "paintpalette.fill")
                    }
                    NavigationLink {
                        Text("Notifications")
                    } label: {
                        Label("Notifications", systemImage: "bell.fill")
                    }
                }
                
                Section("App") {
                    Button(role: .destructive) {
                        
                    } label: {
                        Label("Clear cache", systemImage: "trash")
                    }
                }
                
                Section {
                    Button("Logout", role: .destructive) {
                        Task {
                            await handleLogout()
                        }
                    }
                        .frame(maxWidth: .infinity)
                }
                
                
            }
            .navigationTitle("Settings")
        }
    }
}


#Preview {
    let authViewModel = AuthViewModel()
    authViewModel.currentUser = User(
        id: UUID(),
        email: "example@test.com"
    )

    return SettingsTabView()
        .environmentObject(authViewModel)
}
