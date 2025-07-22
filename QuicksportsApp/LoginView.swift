//
//  LoginView.swift
//  QuicksportsApp
//
//  Created by Илья Невров on 07/06/2025.
//
import SwiftUI

struct LoginView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @State private var isRegistering = false

    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var likedSport = ""
    @State private var sportLevel = ""
    @State private var acceptTerms = false
    @State private var newsletter = false

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
                    if isRegistering {
                        Text("Create an account")
                            .font(.headline)
                            .foregroundColor(.black)

                        TextField("Full name", text: $fullName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        TextField("Liked sport", text: $likedSport)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        TextField("Level", text: $sportLevel)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        Toggle("Accept Terms & Conditions", isOn: $acceptTerms)
                        Toggle("Subscribe to Newsletter", isOn: $newsletter)

                        Button(action: {
                            isLoggedIn = true
                        }) {
                            Text("Register")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }

                        Button(action: { isRegistering = false }) {
                            Text("Back to Login")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                        }
                    } else {
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

                        Button(action: {
                            isRegistering = true
                        }) {
                            Text("Register")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
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
