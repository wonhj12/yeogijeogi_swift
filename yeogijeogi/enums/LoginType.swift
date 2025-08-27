import SwiftUI

enum LoginType {
    case google
    case apple

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
}
