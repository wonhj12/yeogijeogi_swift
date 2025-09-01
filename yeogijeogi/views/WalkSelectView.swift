import SwiftUI

struct WalkSelectView: View {
    @EnvironmentObject private var router: Router
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 24)

            ZStack(alignment: .bottom) {
                NaverMap(
                    isScrollGestureEnabled: false,
                    isZoomGestureEnabled: false,
                    contentInset: UIEdgeInsets(top: 0, left: 0, bottom: 153, right: 0)
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))

                CourseInfoContainer()
                    .padding(20)
            }
            Spacer()
                .frame(height: 8)

            CustomIndicator(currentIndex: 0)
            Spacer()
                .frame(height: 20)

            LargeButton(title: "산책 시작하기") {
                router.path.append(Route.walk)
            }
        }
        .navigationTitle("이런 코스를 추천해요!")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden()
        .surface()
    }
}

#Preview {
    WalkSelectView()
}
