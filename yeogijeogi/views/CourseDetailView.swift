import BottomSheet
import SwiftUI

struct CourseDetailView: View {
    @StateObject private var dialogManager = DialogManager()

    let bottomSheetPosition: BottomSheetPosition

    var body: some View {
        if bottomSheetPosition == .dynamicTop {
            NavigationStack {
                ScrollView {
                    VStack {
                        CourseSummary()

                        Button { dialogManager.show(.deleteCourse) } label: {
                            Text("코스 삭제하기")
                                .font(.caption)
                                .foregroundStyle(.error)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                }
                .navigationTitle("산책 코스 상세 보기")
                .navigationBarTitleDisplayMode(.inline)
                .surface(applyPadding: false)
            }
            .showCustomDialog(
                isPresented: Binding(
                    get: { dialogManager.currentDialog != nil },
                    set: { if !$0 { dialogManager.dismiss() } }
                ),
                dialogType: dialogManager.currentDialog ?? .error,
                action: { dialogManager.performAction() }
            )
        } else {
            VStack {
                //        Text("아직 산책한 코스가 없어요.")
                //            .font(.headline)
                //            .foregroundStyle(.onSurface)

                CourseInfoContainer()
                    .padding(20)
            }
        }
    }
}

#Preview {
    CourseDetailView(bottomSheetPosition: .dynamicTop)
}
