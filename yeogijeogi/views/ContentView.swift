import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .walk

    var body: some View {
        VStack(spacing: 0) {
            switch selectedTab {
            case .course:
                CourseView()

            case .walk:
                OnboardingView()

            case .myPage:
                MyPageView()
            }

            CustomTabView(selectedTab: $selectedTab)
        }
        .background(.surface)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ContentView()
}
