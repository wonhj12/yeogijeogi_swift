import SwiftUI

struct CourseInfoContainer: View {
    var body: some View {
        VStack {
            HStack {
                Text("성북천")
                    .font(.headline)
                    .foregroundStyle(.onSurface)
                Spacer()
                    .frame(width: 8)

                Text("서울 성북구 동선동2가")
                    .font(.caption)
                    .foregroundStyle(.onSurfaceVariant)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
                .frame(height: 20)

            HStack {
                Spacer()

                VStack {
                    Text("1.3km")
                        .font(.callout)
                        .foregroundStyle(.onSurface)
                    Spacer()
                        .frame(height: 8)

                    Text("거리")
                        .font(.caption)
                        .foregroundStyle(.onSurfaceVariant)
                }
                Spacer()

                Divider()
                    .background(.surfaceVariant)
                    .frame(height: 36)
                Spacer()

                VStack {
                    Text("2000")
                        .font(.callout)
                        .foregroundStyle(.onSurface)
                    Spacer()
                        .frame(height: 8)

                    Text("걸음")
                        .font(.caption)
                        .foregroundStyle(.onSurfaceVariant)
                }
                Spacer()

                Divider()
                    .background(.surfaceVariant)
                    .frame(height: 36)
                Spacer()

                VStack {
                    Text("20분")
                        .font(.callout)
                        .foregroundStyle(.onSurface)
                    Spacer()
                        .frame(height: 8)

                    Text("시간")
                        .font(.caption)
                        .foregroundStyle(.onSurfaceVariant)
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(.container)
        .cornerRadius(20)
    }
}

#Preview {
    CourseInfoContainer()
}
