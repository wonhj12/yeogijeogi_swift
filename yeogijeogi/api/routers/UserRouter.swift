import Alamofire
import Foundation

enum UserRouter: RouterInterface {
    case createUser, deleteUser

    var modulePath: String { "/user" }

    var path: String {
        switch self {
        case .createUser, .deleteUser:
            return "/"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .createUser:
            return .post
        case .deleteUser:
            return .delete
        }
    }

    var parameters: Parameters? {
        switch self {
        case .createUser, .deleteUser:
            return nil
        }
    }
}
