import FirebaseAuth
import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var authenticator: Authenticator
    @EnvironmentObject private var dialogManager: DialogManager
    @EnvironmentObject private var userModel: UserModel

    var body: some View {
        if authenticator.signState == .signOut {
            LoginView()
                .presentDialog()
        } else {
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
            .presentDialog()
            .background(.surface)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Router())
        .environmentObject(Authenticator(dialogManager: DialogManager()))
        .environmentObject(DialogManager())
        .environmentObject(UserModel())
}
