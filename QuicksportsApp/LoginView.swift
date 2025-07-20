//
//  LoginView.swift
//  QuicksportsApp
//
//  Created by Илья Невров on 07/06/2025.
//
import SwiftUI

struct LoginView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        ZStack {
            // Background image (with logo already inside)
            Image("LoginBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            // White rounded panel with login controls
            VStack {
                Spacer()

                VStack(spacing: 16) {
                    Text("Log in to The QuickSport")
                        .font(.headline)
                        .foregroundColor(.black)

                    Button(action: {
                        isLoggedIn = true
                    }) {
                        HStack {
                            Image(systemName: "globe")
                            Text("Log in with Google")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }

                    Divider()

                    Button(action: {
                        isLoggedIn = true
                    }) {
                        Text("Log in")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.95))
                .cornerRadius(20)
                .padding()

                Spacer().frame(height: 40)
            }
        }
    }
}
