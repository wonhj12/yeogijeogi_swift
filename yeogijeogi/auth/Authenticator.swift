import Firebase
import FirebaseAuth
import GoogleSignIn

class Authenticator: ObservableObject {
    @Published var signState: SignState = .signOut
    
    private let dialogManager: DialogManager
    
    private var strategy: AuthenticationStrategy?
    private var user: User?
    
    init(dialogManager: DialogManager) {
        self.dialogManager = dialogManager
    }

    func checkSignState() {
        guard let user = Auth.auth().currentUser else {
            updateSignState(.signOut)
            return
        }
        
        self.user = user
//        user.getIDToken { token, _ in
//            if let token = token {
//                print(token)
//            }
//        }
                
        guard let providerData = user.providerData.first else {
            updateSignState(.signOut)
            print("Failed to get strategy: provider data not found")
            return
        }
                
        do {
            switch try LoginType.fromProviderId(providerId: providerData.providerID) {
            case .apple:
                strategy = AppleSignIn()
            case .google:
                strategy = GoogleSignIn(presentingViewController: nil)
            }
        } catch {
            updateSignState(.signOut)
            print("Failed to get strategy: \(error.localizedDescription)")
        }
        
        updateSignState(.signIn)
    }
    
    func signIn(with strategy: AuthenticationStrategy) {
        self.strategy = strategy

        strategy.signIn { [weak self] result in
            guard let self = self else { return }
                    
            switch result {
            case .success(let credential):
                self.firebaseSignin(with: credential)
            case .failure(let error):
                print("Authentication strategy error: \(error.localizedDescription)")
            }
        }
    }
    
    func signOut() {
        guard let strategy else {
            print("Failed to sign out: strategy is nil")
            return
        }
        
        strategy.signOut()
                
        do {
            try Auth.auth().signOut()
            updateSignState(.signOut)
        } catch {
            print("Firebase signOut error: \(error.localizedDescription)")
        }
    }
    
    func withdraw() {
        guard let strategy else {
            print("Failed to withdraw user: strategy is nil")
            return
        }
        
        UserService.shared.deleteUser { [weak self] result in
            guard let self else { return }
                    
            switch result {
            case .success:
                strategy.withdraw { error in
                    if let error = error {
                        print("Failed to withdraw user: \(error.localizedDescription)")
                        return
                    }
                    self.signOut()
                    print("Withdraw completed successfully")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.dialogManager.show(.dialog(type: .error(message: error.localizedDescription)))
                }
            }
        }
    }
    
    private func updateSignState(_ state: SignState) {
        DispatchQueue.main.async {
            self.signState = state
            
            if case .signOut = state {
                self.user = nil
                self.strategy = nil
            }
        }
    }
    
    private func firebaseSignin(with credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                print("Firebase signIn error: \(error.localizedDescription)")
                return
            }
            
            guard let authResult = authResult else {
                print("Auth result is nil.")
                return
            }
                
            if let userInfo = authResult.additionalUserInfo, userInfo.isNewUser {
                UserService.shared.createUser { result in
                    switch result {
                    case .success:
                        self.updateSignState(.signIn)
                    case .failure(let error):
                        DispatchQueue.main.async {
                            self.dialogManager.show(.dialog(type: .error(message: error.localizedDescription)))
                        }
                    }
                }
            } else {
                self.updateSignState(.signIn)
            }
        }
    }
}
