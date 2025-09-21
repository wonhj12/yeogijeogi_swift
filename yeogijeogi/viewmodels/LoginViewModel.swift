import Foundation
import UIKit

@MainActor
class LoginViewModel: ObservableObject {
    private let authenticator: Authenticator

    init(authenticator: Authenticator) {
        self.authenticator = authenticator
    }

    func login(type: LoginType) {
        let strategy: AuthenticationStrategy
        switch type {
        case .apple:
            strategy = AppleSignIn()
        case .google:
            guard let rootViewController = findRootViewController() else {
                print("Google sign-in failed: No root view controller found.")
                return
            }
            strategy = GoogleSignIn(presentingViewController: rootViewController)
        }

        authenticator.signIn(with: strategy)
    }

    private func findRootViewController() -> UIViewController? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return windowScene?.windows.first?.rootViewController
    }
}
