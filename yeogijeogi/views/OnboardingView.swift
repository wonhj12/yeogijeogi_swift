import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            Text("산책을 떠나 볼까요?")
                .font(.title)
                .foregroundStyle(.onSurface)
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()
                .frame(height: 8)

            Text("산책 코스 추천을 위해 몇가지 질문에 대답해 주세요.")
                .font(.headline)
                .foregroundStyle(.onSurface)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
                .frame(height: 40)

            ButtonContainer(title: "얼마나 걸을까요?", buttonText: "1시간 30분")
            Spacer()
                .frame(height: 24)

            SliderContainer(title: "어떤 분위기를 원하시나요?", valueTexts: ["자연", "상관 없음", "도시"])
                .tint(.surface)
            Spacer()
                .frame(height: 24)

            SliderContainer(title: "산책 강도를 선택해 주세요.", valueTexts: ["가벼운", "상관 없음", "운동되는"])
                .tint(.surface)
            Spacer()

            LargeButton(title: "코스 추천 받기")
        }
        .surface()
    }
}

#Preview {
    OnboardingView()
}
