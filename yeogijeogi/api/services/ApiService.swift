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
                if let data = response.data {
                    do {
                        let errorDetail = try JSONDecoder().decode(ErrorDetail.self, from: data)
                        completion(.failure(errorDetail))
                    } catch {
                        completion(.failure(ErrorDetail(detail: "Unknown server error.")))
                    }
                } else {
                    completion(.failure(ErrorDetail(detail: response.error?.localizedDescription ?? "Unknown error.")))
                }
            }
        }
    }

    static func request(_ router: RouterInterface, completion: @escaping (Result<Void, ErrorDetail>) -> Void) {
        session.request(router).validate().responseData { response in
            switch response.result {
            case .success:
                completion(.success(()))
            case .failure:
                if let data = response.data,
                   let errorDetail = try? JSONDecoder().decode(ErrorDetail.self, from: data)
                {
                    completion(.failure(errorDetail))
                } else {
                    completion(.failure(ErrorDetail(detail: response.error?.localizedDescription ?? "Unknown error.")))
                }
            }
        }
    }
}
