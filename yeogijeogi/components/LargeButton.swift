import SwiftUI

struct LargeButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
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
    LargeButton(title: "버튼") {}
}
