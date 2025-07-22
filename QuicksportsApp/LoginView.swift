//
//  LoginView.swift
//  QuicksportsApp
//
//  Created by Илья Невров on 07/06/2025.
//
import SwiftUI

struct LoginView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @State private var showRegisterForm = false

    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var likedSport = ""
    @State private var sportLevel = ""
    @State private var agreeTerms = false
    @State private var subscribeNewsletter = false

    var body: some View {
        ZStack {
            Image("LoginBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Spacer()

                if showRegisterForm {
                    ScrollView {
                        VStack(spacing: 16) {
                            Text("Register")
                                .font(.headline)
                                .foregroundColor(.black)

                            TextField("Full Name", text: $fullName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                            TextField("Email", text: $email)
                                .keyboardType(.emailAddress)
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                            SecureField("Password", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                            TextField("Liked Sport", text: $likedSport)
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                            TextField("Level", text: $sportLevel)
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                            Toggle("Agree to Terms and Conditions", isOn: $agreeTerms)
                            Toggle("Subscribe to Newsletter", isOn: $subscribeNewsletter)

                            Button(action: { isLoggedIn = true }) {
                                Text("Register")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }

                            Button(action: { showRegisterForm = false }) {
                                Text("Back to Login")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            }
                        }
                        .padding()
                    }
                    .background(Color.white.opacity(0.95))
                    .cornerRadius(20)
                    .padding()
                } else {
                    VStack(spacing: 16) {
                        Text("Welcome to QuickSport")
                            .font(.headline)
                            .foregroundColor(.black)

                        Button(action: { isLoggedIn = true }) {
                            Text("Login")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }

                        Button(action: { showRegisterForm = true }) {
                            Text("Register")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.95))
                    .cornerRadius(20)
                    .padding()
                }

                Spacer().frame(height: 40)
            }
        }
    }
}
