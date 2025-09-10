import Alamofire
import Foundation

enum APIService {
    static let session: Session = {
        let interceptor = BaseInterceptor()
        return Session(interceptor: interceptor)
    }()

    static func request<T: Decodable>(_ router: RouterInterface, completion: @escaping (Result<T, ErrorDetail>) -> Void) {
        session.request(router).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(ErrorDetail(detail: "Failed to decode response.")))
                }

            case .failure:
                let error = handleError(from: response)
                completion(.failure(error))
            }
        }
    }

    static func request(_ router: RouterInterface, completion: @escaping (Result<Void, ErrorDetail>) -> Void) {
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

    private static func handleError(from response: AFDataResponse<Data>) -> ErrorDetail {
        if let data = response.data, let errorDetail = try? JSONDecoder().decode(ErrorDetail.self, from: data) {
            return errorDetail
        }

        let errorMessage = response.error?.localizedDescription ?? "unknown-error"
        return ErrorDetail(detail: errorMessage)
    }
}
