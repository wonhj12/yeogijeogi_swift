import SwiftUI

struct LoginButton: View {
    let type: LoginType

    var body: some View {
        Button {} label: {
            HStack {
                Image(type.icon)
                    .frame(width: 20, height: 20)
                Spacer()

                Text(type.text)
                    .foregroundStyle(.onSurface)
                    .font(.callout)
                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .frame(height: 48)
        .background(.container)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    LoginView()
}
