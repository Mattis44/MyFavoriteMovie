import SwiftUI

//
//  LoginForm.swift
//  MyFavoriteMovie
//
//  Created by Mattis Naud on 01/01/2026.
//

struct LoginForm: View {
    let onForgotPassword: () -> Void
    let onRegister: () -> Void
    
    @EnvironmentObject var authViewModel: AuthViewModel

    @State private var email = "test@test.com"
    @State private var password = "Test00"
    @State private var isLoading: Bool = false
    
    func handleLogin() async {
        isLoading = true
        await authViewModel.login(email: email, password: password)
        isLoading = false
    }

    var body: some View {
        VStack(spacing: 20) {
            GlassField(
                icon: "envelope",
                placeholder: "Email",
                text: $email
            )

            GlassField(
                icon: "lock",
                placeholder: "Password",
                text: $password
            )

            Button("Forgot password?") {
                onForgotPassword()
            }
            .foregroundColor(.white.opacity(0.7))

            GradientButton(text: "Sign in", isLoading: isLoading) {
                Task {
                    await handleLogin()
                }
            }

            Button("Create an account") {
                onRegister()
            }
            .foregroundColor(.white)
        }
    }
}
