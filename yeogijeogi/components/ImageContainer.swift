import SwiftUI

struct ImageContainer: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.container)
                .cornerRadius(20)

            VStack {
                Image(.appIcon)
                    .frame(width: 128, height: 128)

                Text("이미지를 불러오지 못했어요ㅠㅠ")
                    .font(.headline)
                    .foregroundStyle(.onSurface)
            }
        }
    }
}

#Preview {
    ImageContainer()
}
