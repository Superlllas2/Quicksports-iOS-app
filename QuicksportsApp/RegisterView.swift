import SwiftUI

struct RegisterView: View {
    @Binding var isLoggedIn: Bool
    @Environment(\.presentationMode) var presentationMode

    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var likedSport = ""
    @State private var level = ""
    @State private var agreeTerms = false
    @State private var subscribeNewsletter = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Account")) {
                    TextField("Full Name", text: $fullName)
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                }

                Section(header: Text("Preferences")) {
                    TextField("Liked Sport", text: $likedSport)
                    TextField("Sport Level", text: $level)
                    Toggle("I agree to the Terms and Conditions", isOn: $agreeTerms)
                    Toggle("Subscribe to Newsletter", isOn: $subscribeNewsletter)
                }

                Section {
                    Button(action: {
                        isLoggedIn = true
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Register")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .navigationTitle("Register")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RegisterView(isLoggedIn: .constant(false))
}
