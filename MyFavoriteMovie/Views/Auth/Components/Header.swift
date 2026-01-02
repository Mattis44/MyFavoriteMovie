import SwiftUI

//
//  Header.swift
//  MyFavoriteMovie
//
//  Created by Mattis Naud on 01/01/2026.
//

struct Header: View {
    var body: some View {
        Image(systemName: "circle.hexagongrid.fill")
           .font(.system(size: 60))
           .foregroundColor(.white)
                   
       Text("My Favorite Movie")
           .font(.largeTitle)
           .fontWeight(.bold)
           .foregroundColor(.white)
    }
}
