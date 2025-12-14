//
//  HomeView.swift
//  QuicksportsApp
//
//  Created by Илья Невров on 07/06/2025.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        EventsListView()
            .navigationTitle("Home")
    }
}

#Preview {
    HomeView()
}
