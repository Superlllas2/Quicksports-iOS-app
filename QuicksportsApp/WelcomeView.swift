//
//  WelcomeView.swift
//  QuicksportsApp
//
//  Created by Илья Невров on 07/06/2025.
//

import SwiftUI

struct WelcomeView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @State private var isActive = false
    @State private var opacity = 1.0

    var body: some View {
        if isActive {
            if isLoggedIn {
//                HomeView()
                LoginView()
            } else {
                LoginView()
            }
        } else {
            // Splash screen with logo
            VStack {
                Spacer()
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .opacity(opacity)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .ignoresSafeArea()
            .onAppear {
                // Wait then fade out
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeOut(duration: 0.3)) {
                        opacity = 0.0
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    isActive = true
                }
            }
        }
    }

}

#Preview {
    WelcomeView()
}
