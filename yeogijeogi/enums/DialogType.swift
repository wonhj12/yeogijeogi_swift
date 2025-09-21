import SwiftUI

/// The kinds of dialogs that can be displayed.
///
/// Each case in this enum represents a specific type of dialog with its own
/// title, content, and button configuration. This allows for consistent and
/// reusable dialog presentations throughout the app.
enum DialogType {
    /// A dialog that asks for confirmation before logging out.
    case logout
    /// A dialog that asks for confirmation before withdrawing from the service.
    case withdraw
    /// A dialog that warns the user that their changes will be lost.
    case notSave
    /// A dialog that asks for confirmation before deleting a course.
    case deleteCourse
    /// A dialog that asks for confirmation before starting a course.
    case startCourse
    /// A dialog that displays an error message.
    /// - Parameter message: An optional custom message to display.
    case error(message: String?)
}

// MARK: - Display strings

extension DialogType {
    /// The title of the dialog.
    var title: String {
        switch self {
        case .logout:
            return "로그아웃 하시겠어요?"
        case .withdraw:
            return "회원을 탈퇴하시겠어요?"
        case .notSave:
            return "저장하지 않고 종료할까요?"
        case .deleteCourse:
            return "코스를 삭제할까요?"
        case .startCourse:
            return "이 코스로 산책을 시작할까요?"
        case .error:
            return "오류가 발생했습니다."
        }
    }

    /// The descriptive content of the dialog.
    var content: String {
        switch self {
        case .logout:
            return "언제든지 다시 로그인할 수 있어요."
        case .withdraw:
            return "이 작업은 다시 되돌릴 수 없어요."
        case .notSave:
            return "코스 데이터가 저장되지 않고 사라져요."
        case .deleteCourse:
            return "이 작업은 다시 되돌릴 수 없어요."
        case .startCourse:
            return "목적지가 이 코스로 설정돼요."
        case .error(let message):
            return message ?? "다시 시도해 주세요."
        }
    }
}

// MARK: - Buttons

extension DialogType {
    /// The title for the primary action button.
    var primaryButtonTitle: String {
        switch self {
        case .logout:
            return "로그아웃"
        case .withdraw:
            return "회원탈퇴"
        case .notSave:
            return "종료"
        case .deleteCourse:
            return "삭제"
        case .startCourse:
            return "산책하기"
        case .error:
            return "확인"
        }
    }

    /// The color for the primary action button.
    var primaryButtonColor: Color {
        switch self {
        case .logout, .withdraw, .notSave, .deleteCourse, .error:
            return .error
        case .startCourse:
            return .primaryGreen
        }
    }

    /// A Boolean value indicating whether the dialog has a cancel button.
    var hasCancelButton: Bool {
        switch self {
        case .error:
            return false
        default:
            return true
        }
    }
}
