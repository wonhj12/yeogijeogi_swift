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
                .onAppear { authenticator.checkSignState() }
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
            .background(.surface)
            .ignoresSafeArea(edges: .bottom)
            .showCustomDialog(
                isPresented: Binding(
                    get: { dialogManager.currentDialog != nil },
                    set: { if !$0 { dialogManager.dismiss() } }
                ),
                dialogType: dialogManager.currentDialog ?? .error,
                action: { dialogManager.performAction() }
            )
            .onAppear {
                UserService.shared.getUser { result in
                    switch result {
                    case .success(let dto):
                        userModel.fromGetUserDTO(dto: dto)
                    case .failure(let error):
                        print(error.detail)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Router())
        .environmentObject(Authenticator())
        .environmentObject(DialogManager())
        .environmentObject(UserModel())
}
