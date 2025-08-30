import SwiftUI

struct WalkSaveView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("산책 코스는 어땠나요?")
                    .font(.title)
                    .foregroundStyle(.onSurface)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                    .frame(height: 8)

                Text("산책이 어땠는지 간단하게 정리해 보세요.")
                    .font(.headline)
                    .foregroundStyle(.onSurface)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                    .frame(height: 40)

                ImageContainer()
                Spacer()
                    .frame(height: 24)

                CourseInfoContainer()
                Spacer()
                    .frame(height: 24)

                SliderContainer(title: "분위기가 어떘나요?", valueTexts: ["자연", "", "도시"])
                Spacer()
                    .frame(height: 24)

                SliderContainer(title: "산책 강도는 어떘나요?", valueTexts: ["쉬움", "적당함", "어려움"])
                Spacer()
                    .frame(height: 24)

                MemoContainer()
                Spacer()
                    .frame(height: 40)

                LargeButton(title: "산책 코스 저장하기")
            }
            .padding(.horizontal, 20)
        }
        .surface(applyPadding: false)
    }
}

#Preview {
    WalkSaveView()
}
