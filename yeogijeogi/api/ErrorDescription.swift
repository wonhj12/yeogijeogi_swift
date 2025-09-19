import Foundation

struct ErrorDetail: Codable {
    let detail: String
}

enum APIError: Error, LocalizedError {
    case decodingFailed(Error)
    case networkError(Error)

    // Default
    case badRequest(detail: String?) // 400
    case unauthorized(detail: String?) // 401
    case forbidden(detail: String?) // 403
    case notFound(detail: String?) // 404
    case serverError(statusCode: Int) // 5xx

    case unknown

    // Token
    case invalidToken // 401 invalid-token
    case tokenExpired // 401 token-expired
    case tokenRevoked // 401 token-revoked

    // User
    case userNotFound // 404 user-not-found
    case userAlreadyExist // 409 user-already-exists
    case userWithdrawalFailed // 500 user-withdrawal-failed

    // Course
    case courseFetchFailed // 500 course-fetch-failed

    var errorDescription: String? {
        switch self {
        case .decodingFailed:
            return "받아온 정보를 처리하는데 실패했습니다."

        case .networkError:
            return "인터넷 연결을 확인해주세요."

        case .badRequest(let detail):
            if let detail {
                return "잘못된 요청입니다. 다시 시도해 주세요. (\(detail))"
            } else {
                return "잘못된 요청입니다. 다시 시도해 주세요."
            }

        case .unauthorized(let detail):
            if let detail {
                return "로그인이 만료되었습니다. 다시 로그인해주세요. (\(detail))"
            } else {
                return "로그인이 만료되었습니다. 다시 로그인해주세요."
            }

        case .forbidden(let detail):
            if let detail {
                return "접근 권한이 없습니다. (\(detail))"
            } else {
                return "접근 권한이 없습니다."
            }

        case .notFound(let detail):
            if let detail {
                return "요청하신 정보를 찾을 수 없습니다. (\(detail))"
            } else {
                return "요청하신 정보를 찾을 수 없습니다."
            }

        case .serverError(let statusCode):
            return "서버에 문제가 발생했습니다. 잠시 후 다시 시도해주세요. (\(statusCode))"

        case .invalidToken:
            return "로그인이 만료되었습니다. 다시 로그인해주세요."

        case .tokenExpired:
            return "로그인이 만료되었습니다. 다시 로그인해주세요."

        case .tokenRevoked:
            return "로그인이 만료되었습니다. 다시 로그인해주세요."

        case .userNotFound:
            return "존재하지 않는 사용자입니다."

        case .userAlreadyExist:
            return "이미 존재하는 사용자입니다."

        case .userWithdrawalFailed:
            return "사용자 탈퇴에 실패했습니다."

        case .courseFetchFailed:
            return "코스를 불러오는데 실패했습니다."

        default:
            return "알 수 없는 오류가 발생했습니다."
        }
    }
}
