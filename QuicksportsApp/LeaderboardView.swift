//
//  LeaderboardView.swift
//  QuicksportsApp
//
//  Created by Илья Невров on 14/12/2025.
//

import SwiftUI

struct LeaderboardView: View {
    private let players: [(name: String, score: Int)] = [
        ("Ilia Nevrov", 99999999999999999),
        ("Sam Rivera", 965),
        ("Taylor Kim", 952),
        ("Jordan Lee", 940),
        ("Casey Patel", 928),
        ("Riley Chen", 917),
        ("Jamie Brown", 905),
        ("Morgan Diaz", 892),
        ("Quinn Davis", 881),
        ("Parker Evans", 870)
    ]

    var body: some View {
        List(Array(players.enumerated()), id: \.offset) { index, player in
            HStack {
                Text("\(index + 1)")
                    .font(.headline)
                    .frame(width: 30, alignment: .leading)
                VStack(alignment: .leading) {
                    Text(player.name)
                        .font(.body)
                        .fontWeight(.semibold)
                    Text("Score: \(player.score)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            .padding(.vertical, 8)
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    NavigationStack {
        LeaderboardView()
            .navigationTitle("Leaderboard")
    }
}
