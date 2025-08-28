import SwiftUI

struct SliderContainer: View {
    let title: String
    let valueTexts: [String]

    @State private var value = 0.0

    var body: some View {
        VStack {
            Text(title)
                .font(.body)
                .foregroundStyle(.onSurface)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
                .frame(height: 20)

            CustomSlider(value: $value)

            Spacer()
                .frame(height: 8)

            ZStack {
                HStack {
                    Text(valueTexts[0])
                        .font(.caption)
                        .foregroundStyle(.onSurfaceVariant)
                    Spacer()

                    Text(valueTexts[2])
                        .font(.caption)
                        .foregroundStyle(.onSurfaceVariant)
                }

                Text(valueTexts[1])
                    .font(.caption)
                    .foregroundStyle(.onSurfaceVariant)
            }
        }
        .frame(width: .infinity, height: 120)
        .padding(.horizontal, 20)
        .background(.container)
        .cornerRadius(20)
    }
}

#Preview {
    OnboardingView()
}
