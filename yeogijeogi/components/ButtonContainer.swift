import SwiftUI

struct ButtonContainer: View {
    var title: String
    var buttonText: String
    var action: () -> Void = {}

    var body: some View {
        HStack {
            Text(title)
                .font(.body)
                .foregroundStyle(.onSurface)
            Spacer()

            Button(action: action) {
                Text(buttonText)
                    .font(.body)
                    .foregroundStyle(.onSurface)
            }
            .frame(width: 128, height: 36)
            .background(.surface)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(height: 64)
        .padding(.horizontal, 20)
        .background(.container)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    ButtonContainer(title: "얼마나 걸을까요?", buttonText: "1시간 30분")
}
