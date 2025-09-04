import Firebase
import FirebaseAuth
import GoogleSignIn

class Authenticator: ObservableObject {
    @Published var signState: SignState = .signOut
    
    private var strategy: AuthenticationStrategy?
    
    func checkSignState() {
        signState = Auth.auth().currentUser != nil ? .signIn : .signOut
    }
    
    func signIn(with strategy: AuthenticationStrategy) {
        self.strategy = strategy

        strategy.signIn { [weak self] result in
            guard let self = self else { return }
                    
            switch result {
            case .success(let credential):
                Auth.auth().signIn(with: credential) { _, error in
                    if let error = error {
                        print("Firebase signIn error: \(error.localizedDescription)")
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self.signState = .signIn
                    }
                }
            case .failure(let error):
                print("Authentication strategy error: \(error.localizedDescription)")
            }
        }
    }
    
    func signOut() {
        strategy?.signOut()
        
        do {
            try Auth.auth().signOut()
            signState = .signOut
        } catch {
            print(error.localizedDescription)
        }
    }
}
