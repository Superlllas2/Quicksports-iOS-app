import SwiftUI

struct RegisterStepOneView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 40) {
            Spacer()

            // Logo or title
            Image("LogoName")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)

            VStack(spacing: 16) {
                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
            }
            .padding(.horizontal, 32)

            VStack(spacing: 16) {
                Button(action: {
                    // Handle Google sign up
                }) {
                    HStack {
                        Image(systemName: "globe") // use real Google logo if you want
                        Text("Sign up with Google")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                }

                Button(action: {
                    // Handle Apple sign up
                }) {
                    HStack {
                        Image(systemName: "apple.logo")
                        Text("Sign up with Apple")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal, 32)

            Spacer()

            NavigationLink(destination: RegisterStepTwoView()) {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 20)
        }
        .navigationTitle("Register")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        RegisterStepOneView()
    }
}
