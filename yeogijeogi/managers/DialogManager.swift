import SwiftUI

final class DialogManager: ObservableObject {
    @Published var currentDialog: AnyDialog? = nil

    func show(_ dialog: AnyDialog) {
        guard currentDialog == nil else { return }
        currentDialog = dialog
    }

    func dismiss() {
        currentDialog = nil
    }
}

struct DialogPresenter: ViewModifier {
    @EnvironmentObject var dialogManager: DialogManager

    func body(content: Content) -> some View {
        content.overlay {
            if let dialog = dialogManager.currentDialog {
                ZStack {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture {
                            if dialog.isBackgroundDismissable {
                                dialogManager.dismiss()
                            }
                        }

                    switch dialog {
                    case .dialog(let type, let action):
                        CustomDialog(
                            type: type,
                            action: action,
                            onDismiss: dialogManager.dismiss
                        )
                        .padding(.horizontal, 20)

                    case .timePicker(let walkTime):
                        TimePickerDialog(
                            walkTime: walkTime,
                            onDismiss: dialogManager.dismiss
                        )
                        .padding(.horizontal, 20)
                    }
                }
            }
        }
    }
}

extension View {
    func presentDialog() -> some View {
        modifier(DialogPresenter())
    }
}
