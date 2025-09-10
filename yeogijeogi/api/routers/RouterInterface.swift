import Alamofire
import Foundation

protocol RouterInterface: URLRequestConvertible {
    var modulePath: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
}

extension RouterInterface {
    var baseURL: URL {
        guard let serverURLString: String = Configuration.value(for: "SERVER_URL") else {
            fatalError("Could not find 'SERVER_URL' in Info.plist.")
        }
        
        guard let url = URL(string: serverURLString)?.appendingPathComponent(modulePath) else {
            fatalError("'SERVER_URL' or 'modulePath' is not valid.")
        }
        
        return url
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        if let parameters = parameters {
            request = try JSONEncoding.default.encode(request, with: parameters)
        }
        
        return request
    }
}
