import Alamofire
import FirebaseAuth

final class BaseInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard urlRequest.value(forHTTPHeaderField: "Authorization") == nil,
              let user = Auth.auth().currentUser
        else {
            completion(.success(urlRequest))
            return
        }

        user.getIDToken { token, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let token = token {
                var request = urlRequest
                request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                completion(.success(request))
            } else {
                completion(.success(urlRequest))
            }
        }
    }
}
