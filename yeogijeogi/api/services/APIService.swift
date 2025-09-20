import Alamofire
import Foundation

enum APIService {
    static let session: Session = {
        let configuration = URLSessionConfiguration.default

        // 요청 타임아웃 시간
        configuration.timeoutIntervalForRequest = 10

        // 리소스 타임아웃 시간
        configuration.timeoutIntervalForResource = 30

        let interceptor = BaseInterceptor()

        return Session(configuration: configuration, interceptor: interceptor)
    }()

    static func request<T: Decodable>(_ router: RouterInterface, completion: @escaping (Result<T, APIError>) -> Void) {
        session.request(router).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(.decodingFailed(error)))
                }

            case .failure:
                let error = handleError(from: response)
                completion(.failure(error))
            }
        }
    }

    static func request(_ router: RouterInterface, completion: @escaping (Result<Void, APIError>) -> Void) {
        session.request(router).validate().responseData { response in
            switch response.result {
            case .success:
                completion(.success(()))
            case .failure:
                let error = handleError(from: response)
                completion(.failure(error))
            }
        }
    }

    private static func handleError(from response: AFDataResponse<Data>) -> APIError {
        if let afError = response.error {
            return .networkError(afError)
        }

        guard let statusCode = response.response?.statusCode else {
            return .unknown
        }

        let errorDetail: ErrorDetail? = {
            if let data = response.data {
                return try? JSONDecoder().decode(ErrorDetail.self, from: data)
            }
            return nil
        }()

        switch statusCode {
        case 401:
            switch errorDetail?.detail {
            case "invalid-token": return .invalidToken
            case "token-expired": return .tokenExpired
            case "token-revoked": return .tokenRevoked
            default:
                return .unauthorized(detail: errorDetail?.detail)
            }

        case 403:
            return .forbidden(detail: errorDetail?.detail)

        case 404:
            switch errorDetail?.detail {
            case "user-not-found": return .userNotFound
            default:
                return .notFound(detail: errorDetail?.detail)
            }

        case 409:
            switch errorDetail?.detail {
            case "user-already-exists": return .userAlreadyExist
            default:
                return .badRequest(detail: errorDetail?.detail)
            }

        case 400...499:
            return .badRequest(detail: errorDetail?.detail)

        case 500...599:
            switch errorDetail?.detail {
            case "user-withdrawal-failed": return .userWithdrawalFailed
            case "course-fetch-failed": return .courseFetchFailed
            default:
                return .serverError(statusCode: statusCode)
            }

        default:
            return .unknown
        }
    }
}
