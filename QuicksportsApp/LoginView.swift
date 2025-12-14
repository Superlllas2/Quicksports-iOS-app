//
//  LoginView.swift
//  QuicksportsApp
//
//  Created by Илья Невров on 07/06/2025.
//
import SwiftUI

struct LoginView: View {
    @AppStorage(AppKeys.isLoggedIn) private var isLoggedIn = false

    var body: some View {
        NavigationStack {
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
                        Text("Welcome to QuickSport")
                            .font(.headline)
                            .foregroundColor(.black)

                        Button(action: {
                            isLoggedIn = true
                        }) {
                            Text("Login")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }

                        NavigationLink(destination: RegisterStepOneView()) {
                            Text("Register")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
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
            .navigationBarHidden(true)
        }
    }
}
