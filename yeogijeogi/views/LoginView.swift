import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Spacer()

            LoginButton(type: .google)
            Spacer()
                .frame(height: 12)

            LoginButton(type: .apple)
            Spacer()
                .frame(height: 98)
        }
        .padding(.horizontal, 20)
        .surface()
    }
}

#Preview {
    LoginView()
}
