import SwiftUI

//
//  OTPForm.swift
//  MyFavoriteMovie
//
//  Created by Mattis Naud on 01/01/2026.
//


struct OTPForm: View {
    let onBack: () -> Void
    @State private var code = ""

    var body: some View {
        VStack(spacing: 20) {
            GlassField(
                icon: "number",
                placeholder: "OTP Code",
                text: $code
            )

            GradientButton(text: "Verify") {
                print("Verify")
            }
            Button("Back") {
                onBack()
            }
            .foregroundColor(.white.opacity(0.7))
        }
    }
}
