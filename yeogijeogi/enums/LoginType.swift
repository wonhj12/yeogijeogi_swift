import SwiftUI

/// The available social login methods.
///
/// This enum represents the different providers that can be used for user authentication.
enum LoginType {
    /// Sign in with Google.
    case google
    /// Sign in with Apple.
    case apple
}

// MARK: - Supporting Types

extension LoginType {
    /// An error that can occur when determining the login type.
    enum LoginTypeError: Error {
        /// Indicates that the provider ID is unknown.
        case unknownProvider(String)
    }
}

// MARK: - Display Properties

extension LoginType {
    /// The text displayed on the login button.
    var text: String {
        switch self {
        case .google:
            return "Google로 시작하기"
        case .apple:
            return "Apple로 시작하기"
        }
    }

    /// The icon displayed on the login button.
    var icon: ImageResource {
        switch self {
        case .google:
            return .googleLogo
        case .apple:
            return .appleLogo
        }
    }
}

// MARK: - Conversion

extension LoginType {
    /// Creates a `LoginType` from a provider ID string.
    ///
    /// - Parameter providerId: The provider ID from the authentication service.
    /// - Returns: A `LoginType` that corresponds to the provider ID.
    /// - Throws: `LoginTypeError.unknownProvider` if the provider ID is not recognized.
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