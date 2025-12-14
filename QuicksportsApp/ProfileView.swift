//
//  ProfileView.swift
//  QuicksportsApp
//
//  Created by Илья Невров on 14/12/2025.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage(AppKeys.isLoggedIn) private var isLoggedIn = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                topRow
                eloCard
                logoutButton
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }

    private var topRow: some View {
        HStack(alignment: .top, spacing: 16) {
            Circle()
                .fill(Color(.systemGray5))
                .frame(width: 72, height: 72)
                .overlay {
                    Image(systemName: "person.fill")
                        .font(.title)
                        .foregroundStyle(.secondary)
                }

            VStack(alignment: .leading, spacing: 6) {
                Text("Hi Ilia Nevrov, welcome!")
                    .font(.headline)
                Text("ilia@nevrov.org")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            VStack(spacing: 8) {
                // EDIT PROFILE BUTTON - NOT WORKING
                // TODO: MAKE EDIT PROFILE WORKING
                Button {
                } label: {
                    Text("Edit profile")
                        .font(.subheadline)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray5))
                        .foregroundColor(.primary)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }

                // WALLET BUTTON
                NavigationLink(destination: WalletView().navigationTitle("Wallet")) {
                    Text("Wallet")
                        .font(.subheadline)
                        .padding(.horizontal, 29)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var eloCard: some View {
        VStack(spacing: 16) {
            Text("Total ELO: 4.12")
                .font(.title2)
                .fontWeight(.semibold)

            HStack(spacing: 0) {
                eloStat(icon: "soccerball", value: "-")
                Divider()
                eloStat(icon: "volleyball", value: "4.12")
                Divider()
                eloStat(icon: "basketball", value: "-")
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private func eloStat(icon: String, value: String) -> some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.secondary)
            Text(value)
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 4)
    }

    private var logoutButton: some View {
        Button {
            isLoggedIn = false
        } label: {
            Text("Logout")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemRed))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding(.top, 8)
    }
}

#Preview {
    NavigationStack {
        ProfileView()
            .navigationTitle("Profile")
    }
}
