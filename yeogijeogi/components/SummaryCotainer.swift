import SwiftUI

struct SummaryCotainer: View {
    var distance: Int
    var time: Int

    var body: some View {
        HStack {
            Spacer()

            VStack {
                Text("지금까지 산책한 거리")
                    .font(.caption)
                    .foregroundStyle(.onSurfaceVariant)
                Spacer()
                    .frame(height: 24)

                HStack(alignment: .lastTextBaseline) {
                    Text(String(distance))
                        .font(.largeTitle)
                        .foregroundStyle(.primaryGreen)
                    Spacer()
                        .frame(width: 4)

                    Text("km")
                        .font(.body)
                        .foregroundStyle(.onSurface)
                }
            }
            Spacer()

            Divider()
                .frame(height: 70)
            Spacer()

            VStack {
                Text("지금까지 산책한 시간")
                    .font(.caption)
                    .foregroundStyle(.onSurfaceVariant)
                Spacer()
                    .frame(height: 24)

                HStack(alignment: .lastTextBaseline) {
                    Text(String(time))
                        .font(.largeTitle)
                        .foregroundStyle(.primaryGreen)
                    Spacer()
                        .frame(width: 4)

                    Text("분")
                        .font(.body)
                        .foregroundStyle(.onSurface)
                }
            }
            Spacer()
        }
        .frame(height: 110)
        .background(.container)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    SummaryCotainer(distance: 0, time: 0)
}
