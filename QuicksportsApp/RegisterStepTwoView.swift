import SwiftUI

struct RegisterStepTwoView: View {
    @State private var fullName = ""
    @State private var likedSport = ""

    var body: some View {
        VStack(spacing: 20) {
            TextField("Full Name", text: $fullName)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            
            TextField("Liked Sport", text: $likedSport)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)

            Spacer()
        }
        .padding()
        .navigationTitle("More Info")
    }
}
