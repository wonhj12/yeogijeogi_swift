import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var authenticator: Authenticator
    @StateObject private var viewModel: LoginViewModel

    init(authenticator: Authenticator) {
        _viewModel = StateObject(wrappedValue: LoginViewModel(authenticator: authenticator))
    }

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

            LoginButton(viewModel: viewModel, type: .google)
            Spacer()
                .frame(height: 12)

            LoginButton(viewModel: viewModel, type: .apple)
            Spacer()
                .frame(height: 98)
        }
        .surface()
    }
}
