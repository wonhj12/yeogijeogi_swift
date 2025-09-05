enum TimePickerType {
    case hour, minute

    var maxValue: Int {
        switch self {
        case .hour:
            return 24
        case .minute:
            return 60
        }
    }

    var stride: Int {
        switch self {
        case .hour:
            return 1
        case .minute:
            return 5
        }
    }

    var label: String {
        switch self {
        case .hour:
            return "시간"
        case .minute:
            return "분"
        }
    }
}
