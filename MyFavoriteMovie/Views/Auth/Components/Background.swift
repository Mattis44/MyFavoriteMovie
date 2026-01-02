import SwiftUI

//
//  Background.swift
//  MyFavoriteMovie
//
//  Created by Mattis Naud on 01/01/2026.
//

struct Background: View {
    
    let violet = Color(red: 115/255, green: 99/255, blue: 170/255)
    let blue = Color(red: 60/255, green: 72/255, blue: 140/255)
    let orange = Color(red: 255/255, green: 170/255, blue: 90/255)
    
    
    var body: some View {
        Color.black
        RadialGradient(
            colors: [violet.opacity(0.8), .clear],
            center: .topLeading,
            startRadius: 50,
            endRadius: 500
        )


        RadialGradient(
            colors: [blue.opacity(0.6), .clear],
            center: .top,
            startRadius: 80,
            endRadius: 600
        )


        RadialGradient(
            colors: [violet.opacity(0.5), .clear],
            center: .topTrailing,
            startRadius: 50,
            endRadius: 450
        )


        RadialGradient(
            colors: [orange.opacity(0.45), .clear],
            center: .bottom,
            startRadius: 0,
            endRadius: 500
        )


        RadialGradient(
            colors: [blue.opacity(0.35), .clear],
            center: .bottomTrailing,
            startRadius: 100,
            endRadius: 500
        )
    }
}
