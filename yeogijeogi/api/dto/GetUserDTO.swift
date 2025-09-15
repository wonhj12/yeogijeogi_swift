import Foundation

struct GetUserResDTO: Codable {
    var walkTime: Int
    var walkDistance: Int

    enum CodingKeys: String, CodingKey {
        case walkTime = "walk_time"
        case walkDistance = "walk_distance"
    }
}
