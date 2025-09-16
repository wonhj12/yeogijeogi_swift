import SwiftUI

struct LoginButton: View {
    @EnvironmentObject private var authenticator: Authenticator

    let type: LoginType

    var body: some View {
        Button {
            switch type {
            case .apple:
                authenticator.signIn(with: AppleSignIn())
            case .google:
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let rootViewController = windowScene.windows.first?.rootViewController {
                    authenticator.signIn(with: GoogleSignIn(presentingViewController: rootViewController))
                } else {
                    // TODO: 로그인 실패 로직 추가 필요
                    print("Google sign-in failed: No root view controller found.")
                }
            }
        } label: {
            HStack {
                Image(type.icon)
                    .frame(width: 20, height: 20)
                Spacer()

                Text(type.text)
                    .foregroundStyle(.onSurface)
                    .font(.callout)
                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .frame(height: 48)
        .background(.container)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    LoginButton(type: .apple)
}
