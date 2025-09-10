class UserService {
    static let shared = UserService()

    private init() {}

    func createUser(completion: @escaping (Result<Void, ErrorDetail>) -> Void) {
        APIService.request(UserRouter.createUser, completion: completion)
    }
}
