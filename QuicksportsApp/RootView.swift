//
//  RootView.swift
//  QuicksportsApp
//
//  Created by Илья Невров on 14/12/2025.
//
import SwiftUI

struct RootView: View {
    @AppStorage(AppKeys.isLoggedIn) private var isLoggedIn = false
    @State private var showSplash = true
    @State private var splashOpacity = 1.0

    var body: some View {
        ZStack {
            if isLoggedIn {
                MainTabView()
            } else {
                LoginView()
            }

            if showSplash {
                SplashView()
                    .opacity(splashOpacity)
                    .transition(.opacity)
            }
        }
        .onAppear(perform: startSplash)
    }

    private func startSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeOut(duration: 0.3)) {
                splashOpacity = 0.0
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation {
                showSplash = false
            }
        }
    }
}

#Preview {
    RootView()
}
