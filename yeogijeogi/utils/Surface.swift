import SwiftUI

extension View {
    func surface(applyPadding: Bool = true) -> some View {
        modifier(Surface(applyPadding: applyPadding))
    }
}

struct Surface: ViewModifier {
    var applyPadding: Bool

    func body(content: Content) -> some View {
        ZStack {
            Color(.surface)
                .ignoresSafeArea()

            content
                .padding(.horizontal, applyPadding ? 20 : 0)
                .padding(.bottom, applyPadding ? 20 : 0)
        }
    }
}
