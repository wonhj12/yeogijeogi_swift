import FirebaseAuth

protocol AuthenticationStrategy {
    func signIn(completion: @escaping (Result<AuthCredential, Error>) -> Void)
    func signOut()
    func withdraw(completion: @escaping (Error?) -> Void)
}
