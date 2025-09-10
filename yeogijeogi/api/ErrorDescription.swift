import Foundation

struct ErrorDetail: Codable, LocalizedError {
    let detail: String

    var errorDescription: String? {
        return detail
    }
}
