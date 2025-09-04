import Firebase
import FirebaseAuth
import GoogleSignIn

class GoogleSignIn: NSObject, AuthenticationStrategy {
    private weak var presentingViewController: UIViewController?

    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
    }

    func signIn(completion: @escaping (Result<AuthCredential, Error>) -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            completion(.failure(NSError(domain: "GoogleSignIn", code: -1, userInfo: [NSLocalizedDescriptionKey: "Firebase clientID not found."])))
            return
        }
        
        let configuration = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = configuration
        
        guard let viewController = presentingViewController else {
            completion(.failure(NSError(domain: "GoogleSignIn", code: -2, userInfo: [NSLocalizedDescriptionKey: "Presenting view controller is not set."])))
            return
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                completion(.failure(NSError(domain: "GoogleSignIn", code: -3, userInfo: [NSLocalizedDescriptionKey: "ID token not found."])))
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            completion(.success(credential))
        }
    }
    
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
    }
}
