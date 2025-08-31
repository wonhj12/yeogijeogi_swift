import SwiftUI

struct CourseSummary: View {
    var body: some View {
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
    }
}

#Preview {
    CourseSummary()
}
