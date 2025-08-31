import SwiftUI

struct CourseDetailView: View {
    let selectedDetent: PresentationDetent

    var body: some View {
        if selectedDetent == .large {
            NavigationStack {
                ScrollView {
                    VStack {
                        CourseSummary()

                        Button {} label: {
                            Text("삭제하기")
                                .font(.caption)
                                .foregroundStyle(.error)
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .navigationTitle("산책 코스 상세 보기")
                .navigationBarTitleDisplayMode(.inline)
                .surface(applyPadding: false)
            }
        } else {
            VStack {
                //        Text("아직 산책한 코스가 없어요.")
                //            .font(.headline)
                //            .foregroundStyle(.onSurface)

                CourseInfoContainer()
            }
            .surface()
        }
    }
}

#Preview {
    CourseDetailView(selectedDetent: .large)
}
