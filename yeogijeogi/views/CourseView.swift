import BottomSheet
import SwiftUI

struct CourseView: View {
    @State private var bottomSheetPosition: BottomSheetPosition = .dynamic

    var body: some View {
        NaverMap(contentInset: UIEdgeInsets(top: 0, left: 0, bottom: 173, right: 0))
            .ignoresSafeArea()
            .bottomSheet(
                bottomSheetPosition: $bottomSheetPosition,
                switchablePositions: [.dynamicBottom, .dynamic, .dynamicTop]
            ) {
                CourseDetailView(bottomSheetPosition: bottomSheetPosition)
            }
            .enableContentDrag()
            .dragIndicatorColor(.onSurfaceVariant)
            .customBackground(
                Color.surface
                    .clipShape(.rect(topLeadingRadius: 20, topTrailingRadius: 20))
            )
    }
}

#Preview {
    CourseView()
}
