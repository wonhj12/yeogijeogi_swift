import SwiftUI

struct TimeSelectContainer: View {
    var body: some View {
        HStack {
            Text("얼마나 걸을까요?")
                .font(.body)
                .foregroundStyle(.onSurface)
            Spacer()

            Button {} label: {
                Text("1시간 30분")
                    .font(.body)
                    .foregroundStyle(.onSurface)
            }
            .frame(width: 128, height: 36)
            .background(.surface)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(width: .infinity, height: 64)
        .padding(.horizontal, 20)
        .background(.container)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    OnboardingView()
}
