import SwiftUI

//
//  GlassField.swift
//  MyFavoriteMovie
//
//  Created by Mattis Naud on 01/01/2026.
//


struct GlassField: View {
    let icon: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white.opacity(0.12))

                Image(systemName: icon)
                    .foregroundColor(.white.opacity(0.85))
            }
            .frame(width: 36, height: 36)
            TextField(
                "",
                text: $text,
                prompt: Text(placeholder)
                    .foregroundColor(.white.opacity(0.5))
            )
            .foregroundColor(.white)
            .textInputAutocapitalization(.none)
        }
        .padding(10)
        .background(
            Color.white.opacity(0.08)
        )
        .cornerRadius(14)
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.white.opacity(0.15))
        )
    }
}
