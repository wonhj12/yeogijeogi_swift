import Foundation

final class DialogManager: ObservableObject {
    @Published var currentDialog: DialogType? = nil
    private var currentAction: (() -> Void)?

    func show(_ dialog: DialogType, action: (() -> Void)? = nil) {
        guard currentDialog == nil else { return }
        currentDialog = dialog
        currentAction = action
    }

    func performAction() {
        currentAction?()
        dismiss()
    }

    func dismiss() {
        currentDialog = nil
        currentAction = nil
    }
}
