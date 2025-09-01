import SwiftUI

struct SettingContainer: View {
    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            HStack {
                Text("앱 버전")
                    .font(.body)
                    .foregroundStyle(.onSurface)
                Spacer()

                Text(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown")
                    .font(.body)
                    .foregroundStyle(.onSurfaceVariant)
            }
            .padding(.horizontal, 20)
            .frame(height: 40, alignment: .leading)
            .background(.container)

            Button {} label: {
                HStack {
                    Text("문의하기")
                        .font(.body)
                        .foregroundStyle(.onSurface)
                    Spacer()

                    Image(systemName: "chevron.right")
                        .font(.body)
                        .foregroundStyle(.onSurfaceVariant)
                }
            }
            .padding(.horizontal, 20)
            .frame(height: 40, alignment: .leading)
            .background(.container)

            Button {} label: {
                HStack {
                    Text("개인정보 처리방침")
                        .font(.body)
                        .foregroundStyle(.onSurface)
                    Spacer()

                    Image(systemName: "chevron.right")
                        .font(.body)
                        .foregroundStyle(.onSurfaceVariant)
                }
            }
            .padding(.horizontal, 20)
            .frame(height: 40, alignment: .leading)
            .background(.container)
            Spacer()
        }
        .background(.container)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .frame(height: 160)
    }
}

#Preview {
    SettingContainer()
}
