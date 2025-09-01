import SwiftUI

enum Tab: CaseIterable {
    case course
    case walk
    case myPage

    var title: String {
        switch self {
        case .course: return "코스"
        case .walk: return "산책"
        case .myPage: return "마이페이지"
        }
    }

    var icon: ImageResource {
        switch self {
        case .course: return .course
        case .walk: return .walk
        case .myPage: return .myPage
        }
    }
}
