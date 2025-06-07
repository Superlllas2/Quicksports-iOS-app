//
//  WelcomeView.swift
//  QuicksportsApp
//
//  Created by Илья Невров on 07/06/2025.
//

import SwiftUI

struct WelcomeView: View {
    // Control when to show main UI
    @State private var isActive = false
    @State private var opacity = 1.0

    var body: some View {
        if isActive {
            // Main app UI
            HomeView()
        } else {
            // Logo splash screen
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
                // Wait 1 sec, then fade out over 1 sec
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeOut(duration: 0.3)) {
                        opacity = 0.0
                    }
                }
                // Switch to HomeView after total 2 seconds
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
