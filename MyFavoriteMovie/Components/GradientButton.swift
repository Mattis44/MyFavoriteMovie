import SwiftUI
//
//  GradientButton.swift
//  MyFavoriteMovie
//
//  Created by Mattis Naud on 01/01/2026.
//

struct GradientButton: View {
    let text: String
    let isLoading: Bool
    let action: () -> Void
    
    private let violet = Color(red: 115/255, green: 99/255, blue: 170/255)
    
    init(
        text: String,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.isLoading = isLoading
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Text(text)
                    .opacity(isLoading ? 0 : 1)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                
                if isLoading {
                    ProgressView()
                        .tint(.white)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                LinearGradient(
                    colors: [
                        violet,
                        Color.orange
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(16)
        }
        .disabled(isLoading)
    }
}
