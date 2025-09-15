import Alamofire
import Foundation

enum UserRouter: RouterInterface {
    case createUser, deleteUser, getUser

    var modulePath: String { "/user" }

    var path: String {
        switch self {
        case .createUser, .deleteUser, .getUser:
            return "/"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getUser:
            return .get
        case .createUser:
            return .post
        case .deleteUser:
            return .delete
        }
    }

    var parameters: Parameters? {
        switch self {
        case .createUser, .deleteUser, .getUser:
            return nil
        }
    }
}
