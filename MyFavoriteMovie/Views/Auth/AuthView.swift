import SwiftUI

//
//  LoginView.swift
//  MyFavoriteMovie
//
//  Created by Mattis Naud on 01/01/2026.
//

enum AuthStep {
    case login
    case otp
    case register
}

struct AuthView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var step: AuthStep = .login
    
    var body: some View {
        ZStack {
            Background()
            
            VStack(spacing: 24) {
                Header()
                switch step {
                    case .register:
                       RegisterForm(
                           onBack: {
                               step = .login
                           }
                       )
                case .login:
                    LoginForm(
                        onForgotPassword: {
                            step = .login
                        },
                        onRegister: {
                            step = .register
                        }
                    )
                case .otp:
                    OTPForm(
                        onBack: {
                            step = .login
                        }
                    )
                }
            }
            .padding()
            .animation(.default, value: step)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    AuthView()
        .environmentObject(AuthViewModel())
}
