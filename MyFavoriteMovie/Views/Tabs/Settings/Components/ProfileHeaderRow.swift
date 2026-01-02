import SwiftUI

//
//  ProfileHeaderRow.swift
//  MyFavoriteMovie
//
//  Created by Mattis Naud on 02/01/2026.
//

struct ProfileHeaderRow: View {
    let email: String
    let subtitle: String
    let avatarURL: URL?
    
    var body: some View {
        HStack(spacing: 16) {
            avatar
            
            VStack(alignment: .leading, spacing: 4) {
                Text(email)
                    .font(.headline)
                
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
            }
        }
        
        .padding(.vertical, 6)
    }
    
    @ViewBuilder
    private var avatar: some View {
        if let avatarURL {
            AsyncImage(url: avatarURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 44, height: 44)
            .clipShape(Circle())
        } else {
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay(
                    Image(systemName: "person.fill")
                        .foregroundStyle(Color.white)
                )
        }
    }
}
