import Foundation

protocol UserServiceProtocol {
    func createUser(completion: @escaping (Result<Void, Error>) -> Void)
    func deleteUser(completion: @escaping (Result<Void, Error>) -> Void)
    func getUser(completion: @escaping (Result<GetUserResDTO, APIError>) -> Void)
}

class UserService: UserServiceProtocol {

    init() {}

    func createUser(completion: @escaping (Result<Void, Error>) -> Void) {
        APIService.request(UserRouter.createUser) { (result: Result<Void, APIError>) in
            completion(result.mapError { $0 as Error })
        }
    }

    func deleteUser(completion: @escaping (Result<Void, Error>) -> Void) {
        APIService.request(UserRouter.deleteUser) { (result: Result<Void, APIError>) in
            completion(result.mapError { $0 as Error })
        }
    }

    func getUser(completion: @escaping (Result<GetUserResDTO, APIError>) -> Void) {
        APIService.request(UserRouter.getUser, completion: completion)
    }
}