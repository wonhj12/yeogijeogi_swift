import SwiftUI

/// A versatile dialog presentation manager.
///
/// Use `AnyDialog` to present different kinds of dialogs, such as alerts with actions
/// or custom time pickers. It provides a unified interface for managing various dialog
/// interactions within the app.
enum AnyDialog {
    /// Presents a standard dialog.
    ///
    /// - Parameters:
    ///   - type: The ``DialogType`` that defines the content and appearance of the dialog.
    ///   - action: A closure to be executed when the primary action button is tapped. Defaults to `nil`.
    case dialog(type: DialogType, action: (() -> Void)? = nil)

    /// Presents a time picker dialog.
    ///
    /// - Parameters:
    ///   - walkTime: A `Binding` to an `Int` that stores the selected time in minutes.
    case timePicker(walkTime: Binding<Int>)
}

extension AnyDialog {
    /// Indicates whether the dialog can be dismissed by tapping on the background.
    ///
    /// The time picker is dismissable, while standard dialogs are not.
    var isBackgroundDismissable: Bool {
        switch self {
        case .dialog:
            return false
        case .timePicker:
            return true
        }
    }
}