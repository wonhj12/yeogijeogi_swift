import SwiftUI

enum AnyDialog {
    case dialog(type: DialogType, action: (() -> Void)? = nil)
    case timePicker(walkTime: Binding<Int>)

    var isBackgroundDismissable: Bool {
        switch self {
        case .dialog:
            return false
        case .timePicker:
            return true
        }
    }
}
