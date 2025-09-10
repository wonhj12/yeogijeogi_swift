import Alamofire
import Foundation

enum UserRouter: RouterInterface {
    case createUser

    var modulePath: String { "/user" }

    var path: String {
        switch self {
        case .createUser:
            return "/"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .createUser:
            return .post
        }
    }

    var parameters: Parameters? {
        switch self {
        case .createUser:
            return nil
        }
    }
}
