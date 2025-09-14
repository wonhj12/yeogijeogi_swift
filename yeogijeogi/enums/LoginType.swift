import SwiftUI

enum LoginType {
    case google
    case apple

    enum LoginTypeError: Error {
        case unknownProvider(String)
    }

    var text: String {
        switch self {
        case .google:
            return "Google로 시작하기"
        case .apple:
            return "Apple로 시작하기"
        }
    }

    var icon: ImageResource {
        switch self {
        case .google:
            return .googleLogo
        case .apple:
            return .appleLogo
        }
    }

    static func fromProviderId(providerId: String) throws -> LoginType {
        switch providerId {
        case "google.com":
            return .google
        case "apple.com":
            return .apple
        default:
            throw LoginTypeError.unknownProvider(providerId)
        }
    }
}
