import SwiftUI

struct CustomIndicator: View {
    let currentIndex: Int

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0 ..< 3, id: \.self) { index in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundStyle(currentIndex == index ? .primaryGreen : .onSurfaceVariant)
            }
        }
    }
}

#Preview {
    CustomIndicator(currentIndex: 0)
}
