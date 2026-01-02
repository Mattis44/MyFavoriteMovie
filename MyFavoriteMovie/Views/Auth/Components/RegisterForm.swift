import SwiftUI

//
//  RegisterForm.swift
//  MyFavoriteMovie
//
//  Created by Mattis Naud on 01/01/2026.
//

struct RegisterForm: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    let onBack: () -> Void
    
    let violet = Color(red: 115/255, green: 99/255, blue: 170/255)
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirm_password = ""
    
    @State private var isLoading = false
    
    func handleRegister() async {
        isLoading = true
        await authViewModel.register(email: email, password: password)
        isLoading = false
    }
    
    private var isFormValid: Bool {
        !email.isEmpty &&
        !password.isEmpty &&
        password == confirm_password
    }
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Email")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.caption)
                    
                    GlassField(icon: "envelope.fill", placeholder: "Enter your email", text: $email)
                }
                        
                VStack(alignment: .leading, spacing: 8) {
                    Text("Password")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.caption)
                    
                    GlassField(icon: "lock.fill", placeholder: "Enter your password", text: $password)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Confirm password")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.caption)
                    
                    GlassField(icon: "lock.fill", placeholder: "Confirm your password", text: $confirm_password)
                }
                
                if let errorMessage = authViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                
                GradientButton(text: "Create an account", isLoading: isLoading) {
                    Task {
                        await handleRegister()
                    }
                }
                .disabled(!isFormValid)
                .opacity(!isFormValid ? 0.5 : 1)
                .animation(.easeInOut(duration: 0.2), value: isFormValid)
                Button("Back") {
                   onBack()
               }
            }
        }
    }
}
