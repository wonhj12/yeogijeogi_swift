import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var router: Router

    var body: some View {
        VStack(spacing: 0) {
            switch router.tab {
            case .course:
                CourseView()

            case .walk:
                NavigationStack(path: $router.path) {
                    OnboardingView()
                        .navigationDestination(for: Route.self) { route in
                            switch route {
                            case Route.walkSelect:
                                WalkSelectView()
                            case Route.walk:
                                WalkView()
                            case Route.walkSave:
                                WalkSaveView()
                            }
                        }
                }

            case .myPage:
                MyPageView()
            }

            if router.path.last != Route.walk && router.path.last != Route.walkSave {
                CustomTabView(selectedTab: $router.tab)
            }
        }
        .background(.surface)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ContentView()
        .environmentObject(Router())
}
