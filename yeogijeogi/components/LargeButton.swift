import SwiftUI

struct LargeButton: View {
    let title: String

    var body: some View {
        Button {} label: {
            Text(title)
                .font(.headline)
                .foregroundStyle(.surface)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 56)
        .background(.primaryGreen)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    LargeButton(title: "버튼")
}
