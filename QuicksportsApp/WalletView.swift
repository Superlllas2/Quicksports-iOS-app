//
//  WalletView.swift
//  QuicksportsApp
//
//  Created by Илья Невров on 14/12/2025.
//

import SwiftUI

struct WalletView: View {
    @AppStorage(AppKeys.walletBalance) private var balance: Double = 0.0
    @State private var topUpAmount: String = ""

    var body: some View {
        Form {
            Section(header: Text("Your balance")) {
                Text("€\(balance, specifier: "%.2f")")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }

            Section(header: Text("Top up")) {
                TextField("Amount", text: $topUpAmount)
                    .keyboardType(.decimalPad)

                Button("Top up", action: topUp)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }

    private func topUp() {
        guard let amount = Double(topUpAmount), amount > 0 else { return }
        balance += amount
        topUpAmount = ""
    }
}

#Preview {
    NavigationStack {
        WalletView()
            .navigationTitle("Wallet")
    }
}
