import SwiftUI

struct WalkSaveView: View {
    @EnvironmentObject private var router: Router

    var body: some View {
        ScrollView {
            VStack {
                Text("산책이 어땠는지 간단하게 정리해 보세요.")
                    .font(.headline)
                    .foregroundStyle(.onSurface)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                    .frame(height: 24)

                CourseSummary()

                LargeButton(title: "산책 코스 저장하기") {
                    router.tab = .course
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .surface(applyPadding: false)
        .navigationTitle("산책 코스는 어땠나요?")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    WalkSaveView()
        .environmentObject(Router())
}
