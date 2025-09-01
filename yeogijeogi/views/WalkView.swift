import SwiftUI

struct WalkView: View {
    @EnvironmentObject private var router: Router

    var body: some View {
        ZStack(alignment: .bottom) {
            NaverMap(
                positionMode: .direction,
                contentInset: UIEdgeInsets(top: 0, left: 0, bottom: 96, right: 0)
            )
            .ignoresSafeArea()

            LargeButton(title: "산책 종료하기") {
                router.path.append(Route.walkSave)
            }
            .padding(20)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    WalkView()
        .environmentObject(Router())
}
