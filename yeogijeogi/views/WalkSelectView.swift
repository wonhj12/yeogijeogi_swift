import SwiftUI

struct WalkSelectView: View {
    var body: some View {
        VStack {
            Text("이런 코스를 추천해요!")
                .font(.title)
                .foregroundStyle(.onSurface)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
                .frame(height: 40)

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

            LargeButton(title: "산책 시작하기")
        }
        .surface()
    }
}

#Preview {
    WalkSelectView()
}
