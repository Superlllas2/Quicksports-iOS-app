//
//  LoginView.swift
//  QuicksportsApp
//
//  Created by Илья Невров on 07/06/2025.
//
import SwiftUI

struct LoginView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    // Registration state
    @State private var showRegistration = false

    // Registration fields (left blank by default)
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var likedSport = ""
    @State private var sportLevel = ""
    @State private var agreeTerms = false
    @State private var subscribeNews = false

    var body: some View {
        ZStack {
            // Background image with app branding
            Image("LoginBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            // White rounded panel with controls
            VStack {
                Spacer()

                Group {
                    if showRegistration {
                        registrationForm
                    } else {
                        loginControls
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

    // Simple login view with two options
    private var loginControls: some View {
        VStack(spacing: 16) {
            Text("Welcome to QuickSport")
                .font(.headline)
                .foregroundColor(.black)

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
                withAnimation { showRegistration = true }
            }) {
                Text("Register")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(.blue)
                    .cornerRadius(10)
            }
        }
    }

    // Registration form with placeholder fields
    private var registrationForm: some View {
        VStack(spacing: 12) {
            Text("Create Account")
                .font(.headline)
                .foregroundColor(.black)

            Group {
                TextField("Full name", text: $fullName)
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                TextField("Liked sport", text: $likedSport)
                TextField("Sport level", text: $sportLevel)
            }
            .textFieldStyle(.roundedBorder)

            Toggle("Agree to Terms and Conditions", isOn: $agreeTerms)
            Toggle("Subscribe to Newsletter", isOn: $subscribeNews)

            Button(action: {
                isLoggedIn = true
            }) {
                Text("Register")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Button(action: {
                withAnimation { showRegistration = false }
            }) {
                Text("Back to Login")
                    .frame(maxWidth: .infinity)
                    .padding()
            }
        }
    }
}
