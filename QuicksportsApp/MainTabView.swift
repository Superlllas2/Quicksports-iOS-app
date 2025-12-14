//
//  MainTabView.swift
//  QuicksportsApp
//
//  Created by Илья Невров on 14/12/2025.
//
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }

            NavigationStack {
                LeaderboardView()
                    .navigationTitle("Leaderboard")
            }
            .tabItem {
                Label("Leaderboard", systemImage: "trophy.fill")
            }

            NavigationStack {
                WalletView()
                    .navigationTitle("Wallet")
            }
            .tabItem {
                Label("Wallet", systemImage: "wallet.pass")
            }

            NavigationStack {
                ProfileView()
                    .navigationTitle("Profile")
            }
            .tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        }
    }
}

#Preview {
    MainTabView()
}
