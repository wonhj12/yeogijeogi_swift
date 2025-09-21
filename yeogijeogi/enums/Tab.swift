import SwiftUI

/// The tabs available in the main tab view.
///
/// This enum defines the main sections of the app that are accessible through the tab bar.
enum Tab: CaseIterable {
    /// The tab for browsing and managing courses.
    case course
    /// The tab for starting and tracking a walk.
    case walk
    /// The tab for user-specific information and settings.
    case myPage
}

extension Tab {
    /// The title of the tab, displayed in the tab bar.
    var title: String {
        switch self {
        case .course: return "코스"
        case .walk: return "산책"
        case .myPage: return "마이페이지"
        }
    }

    /// The icon of the tab, displayed in the tab bar.
    var icon: ImageResource {
        switch self {
        case .course: return .course
        case .walk: return .walk
        case .myPage: return .myPage
        }
    }
}