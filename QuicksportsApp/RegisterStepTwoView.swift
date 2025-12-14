//
//  RegisterStepTwoView.swift
//  QuicksportsApp
//
//  Created by Илья Невров on 07/06/2025.
//
import SwiftUI

struct RegisterStepTwoView: View {
    @State private var fullName = ""
    @State private var likedSport = ""
    @AppStorage(AppKeys.isLoggedIn) private var isLoggedIn = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {
            TextField("Full Name", text: $fullName)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)

            TextField("Liked Sport", text: $likedSport)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)

            Spacer()

            Button("Finish") {
                isLoggedIn = true
                dismiss()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .navigationTitle("More Info")
    }
}

#Preview {
    NavigationStack {
        RegisterStepTwoView()
    }
}
