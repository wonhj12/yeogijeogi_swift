import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            Image(.appIcon)
                .resizable()
                .frame(width: 256, height: 256)
            Image(.appLogoText)
                .resizable()
                .scaledToFit()
                .frame(width: 128)

            Spacer()

            LoginButton(type: .google)
            Spacer()
                .frame(height: 12)

            LoginButton(type: .apple)
            Spacer()
                .frame(height: 98)
        }
        .surface()
    }
}

#Preview {
    LoginView()
        .environmentObject(Authenticator())
}
