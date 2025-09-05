import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var router: Router

    @State private var timePickerPresented: Bool = false
    @State private var walkTime: Int = 30

    var body: some View {
        VStack {
            Text("산책 코스 추천을 위해 몇가지 질문에 대답해 주세요.")
                .font(.headline)
                .foregroundStyle(.onSurface)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
                .frame(height: 24)

            ButtonContainer(title: "얼마나 걸을까요?", buttonText: getTimeText()) {
                timePickerPresented = true
            }
            Spacer()
                .frame(height: 24)

            SliderContainer(title: "어떤 분위기를 원하시나요?", valueTexts: ["자연", "상관 없음", "도시"])
                .tint(.surface)
            Spacer()
                .frame(height: 24)

            SliderContainer(title: "산책 강도를 선택해 주세요.", valueTexts: ["가벼운", "상관 없음", "운동되는"])
                .tint(.surface)
            Spacer()

            LargeButton(title: "코스 추천 받기") {
                router.path.append(Route.walkSelect)
            }
        }
        .surface()
        .navigationTitle("산책을 떠나 볼까요?")
        .navigationBarTitleDisplayMode(.large)
        .showTimePickerDialog(
            isPresented: $timePickerPresented,
            walkTime: $walkTime
        )
    }

    // walkTime 값을 n시간 n분 String 값으로 변환
    private func getTimeText() -> String {
        let hour = walkTime / 60
        let minute = walkTime % 60

        var parts: [String] = []
        if hour > 0 { parts.append("\(hour)시간") }
        if minute > 0 { parts.append("\(minute)분") }

        return parts.isEmpty ? "0분" : parts.joined(separator: " ")
    }
}

#Preview {
    OnboardingView()
        .environmentObject(Router())
}
