import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            NavigationStack {
                EventsListView()
            }
            .tabItem {
                Label("Explore", systemImage: "safari")
            }

            PlaceholderView(title: "Bookings")
                .tabItem {
                    Label("Bookings", systemImage: "calendar")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

private struct PlaceholderView: View {
    let title: String

    var body: some View {
        VStack {
            Text("\(title) Coming Soon")
                .font(.title2)
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

private struct ProfileView: View {
    @AppStorage(AppKeys.isLoggedIn) private var isLoggedIn = false

    var body: some View {
        VStack(spacing: 24) {
            Text("Profile")
                .font(.largeTitle)
                .bold()

            Button {
                isLoggedIn = false
            } label: {
                Text("Logout")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding(.top, 40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

#Preview {
    MainTabView()
}
