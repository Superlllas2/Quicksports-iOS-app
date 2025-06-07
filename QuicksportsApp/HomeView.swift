import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("🏠 Home Screen")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

#Preview {
    HomeView()
}
