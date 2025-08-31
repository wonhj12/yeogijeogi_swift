import SwiftUI

struct CourseView: View {
    @State private var selectedDetent: PresentationDetent = .height(173)

    var body: some View {
        ZStack {
            NaverMap()
                .ignoresSafeArea()
                .sheet(isPresented: .constant(true)) {
                    CourseDetailView(selectedDetent: selectedDetent)
                        .presentationDetents(
                            [.height(173), .large],
                            selection: $selectedDetent
                        )
                        .interactiveDismissDisabled(true)
                        .presentationBackgroundInteraction(
                            .enabled(upThrough: .height(173))
                        )
                        .presentationCornerRadius(20)
                }
        }
    }
}

#Preview {
    CourseView()
}
