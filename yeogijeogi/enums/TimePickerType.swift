/// The components of a time picker.
///
/// This enum defines the different units of time that can be selected in a time picker.
enum TimePickerType {
    /// The hour component.
    case hour
    /// The minute component.
    case minute
}

extension TimePickerType {
    /// The maximum value for the time component.
    var maxValue: Int {
        switch self {
        case .hour:
            return 24
        case .minute:
            return 60
        }
    }

    /// The step value for the time component.
    var stride: Int {
        switch self {
        case .hour:
            return 1
        case .minute:
            return 5
        }
    }

    /// The label for the time component.
    var label: String {
        switch self {
        case .hour:
            return "시간"
        case .minute:
            return "분"
        }
    }
}