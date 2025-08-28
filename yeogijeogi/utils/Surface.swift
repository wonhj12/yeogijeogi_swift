import SwiftUI

extension View {
    func surface() -> some View {
        modifier(Surface())
    }
}

struct Surface: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color(.surface)
                .ignoresSafeArea()

            content
                .padding(.horizontal, 20)
        }
    }
}
