import AuthenticationServices
import CryptoKit
import FirebaseAuth

class AppleSignIn: NSObject, AuthenticationStrategy {
    private var currentNonce: String?
    private var completionHandler: ((Result<AuthCredential, Error>) -> Void)?

    func signIn(completion: @escaping (Result<AuthCredential, Error>) -> Void) {
        completionHandler = completion
        let nonce = randomNonceString()
        currentNonce = nonce

        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce) // SHA256 해시 처리된 nonce

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }

    // 애플 로그인은 별도의 클라이언트 측 로그아웃 API가 필요하지 않음
    func signOut() {}

    func withdraw(completion: @escaping (Error?) -> Void) {
        completion(nil)
    }

    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        var randomBytes = [UInt8](repeating: 0, count: length)
        let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
        if errorCode != errSecSuccess {
            fatalError(
                "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
        }

        let charset: [Character] =
            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")

        let nonce = randomBytes.map { byte in
            charset[Int(byte) % charset.count]
        }

        return String(nonce)
    }

    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()

        return hashString
    }
}

extension AppleSignIn: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .map { $0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .filter { $0.isKeyWindow }.first

        if let keyWindow = keyWindow {
            return keyWindow
        }

        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            return window.windows.first ?? UIWindow()
        }

        return UIWindow()
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if authorization.credential is ASAuthorizationAppleIDCredential {
            guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else {
                completionHandler?(.failure(NSError(domain: "AppleSignIn", code: -1, userInfo: [NSLocalizedDescriptionKey: "Apple ID credential not found."])))
                return
            }

            guard let nonce = currentNonce else {
                completionHandler?(.failure(NSError(domain: "AppleSignIn", code: -2, userInfo: [NSLocalizedDescriptionKey: "Invalid state: A login callback was received, but no login request was sent."])))
                return
            }

            guard let appleIDToken = appleIDCredential.identityToken else {
                completionHandler?(.failure(NSError(domain: "AppleSignIn", code: -3, userInfo: [NSLocalizedDescriptionKey: "Unable to fetch identity token."])))
                return
            }

            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                completionHandler?(.failure(NSError(domain: "AppleSignIn", code: -4, userInfo: [NSLocalizedDescriptionKey: "Unable to serialize token."])))
                return
            }

            let credential = OAuthProvider.appleCredential(withIDToken: idTokenString, rawNonce: nonce, fullName: appleIDCredential.fullName)
            completionHandler?(.success(credential))
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        completionHandler?(.failure(error))
    }
}
