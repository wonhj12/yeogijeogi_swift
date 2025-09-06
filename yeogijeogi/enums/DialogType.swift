import SwiftUI

enum DialogType {
    case logout, withdraw, notSave, deleteCourse, startCourse, error

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
        case .error:
            return "다시 시도해 주세요."
        }
    }

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

    var primaryButtonColor: Color {
        switch self {
        case .logout:
            return .error
        case .withdraw:
            return .error
        case .notSave:
            return .error
        case .deleteCourse:
            return .error
        case .startCourse:
            return .primaryGreen
        case .error:
            return .error
        }
    }
}
