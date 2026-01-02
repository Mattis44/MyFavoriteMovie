import SwiftUI
import Foundation
import Combine
import Supabase

//
//  AuthViewModel.swift
//  MyFavoriteMovie
//
//  Created by Mattis Naud on 01/01/2026.
//

@MainActor
class AuthViewModel: ObservableObject {
    private let supabase = SupabaseManager.shared.client
    
    
    @Published var isAuthenticated = false
    @Published var currentUser: User?
    @Published var errorMessage: String?
    
    init() {
        Task {
            await loadSession()
        }
    }
    
    func login(email: String, password: String) async {
        errorMessage = nil
        do {
            let session = try await supabase.auth.signIn(
                email: email, password: password
            )
            
            currentUser = User(
                id: UUID(uuidString: session.user.id.uuidString)!,
                email: session.user.email ?? ""
            )
            print("session: ", session)
            isAuthenticated = true
        } catch {
            print(error.localizedDescription)
            errorMessage = error.localizedDescription
        }
    }
    
    func register(email: String, password: String) async {
        errorMessage = nil
            
        do {
            let session = try await supabase.auth.signUp(
                email: email,
                password: password
            )
            
            currentUser = User(
                id: UUID(uuidString: session.user.id.uuidString)!,
                email: session.user.email ?? ""
            )
            isAuthenticated = true
        } catch {
            print(error.localizedDescription)
            errorMessage = error.localizedDescription
        }
    }
    
    func logout() async {
        try? await supabase.auth.signOut()
        currentUser = nil
        isAuthenticated = false
    }
    
    private func loadSession() async {
        do {
            let session = try await supabase.auth.session
            
            if !session.isExpired {
                currentUser = User(
                    id: UUID(uuidString: session.user.id.uuidString)!,
                    email: session.user.email ?? ""
                )
                isAuthenticated = true
            }
        } catch {
            isAuthenticated = false
        }
    }
}

struct User: Identifiable {
    let id: UUID
    let email: String
}
