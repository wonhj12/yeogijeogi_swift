import SwiftUI

struct MyPageView: View {
    @EnvironmentObject private var authenticator: Authenticator
    @EnvironmentObject private var dialogManager: DialogManager
    @EnvironmentObject private var userModel: UserModel

    var body: some View {
        NavigationStack {
            VStack {
                Text("여기저기님")
                    .font(.title)
                    .foregroundStyle(.onSurface)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                    .frame(height: 8)

                Text("오늘도 열심히 산책을 하고 계시네요!")
                    .font(.headline)
                    .foregroundStyle(.onSurface)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                    .frame(height: 24)

                SummaryContainer(
                    distance: userModel.distance,
                    time: userModel.time
                )
                Spacer()
                    .frame(height: 24)

                Text("계정")
                    .font(.headline)
                    .foregroundStyle(.onSurface)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                    .frame(height: 16)

                ButtonContainer(title: "닉네임", buttonText: "여기저기")
                Spacer()
                    .frame(height: 24)

                Text("이용 안내")
                    .font(.headline)
                    .foregroundStyle(.onSurface)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                    .frame(height: 16)

                SettingContainer()
                Spacer()

                HStack {
                    Button {
                        dialogManager.show(.dialog(type: .withdraw, action: {
                            authenticator.withdraw()
                        }))
                    } label: {
                        Text("회원탈퇴")
                            .font(.caption)
                            .foregroundStyle(.onSurfaceVariant)
                    }
                    Spacer()
                        .frame(width: 16)

                    Divider()
                        .foregroundStyle(.onSurfaceVariant)
                        .frame(height: 8)
                    Spacer()
                        .frame(width: 16)

                    Button {
                        dialogManager.show(.dialog(type: .logout, action: {
                            authenticator.signOut()
                        }))
                    } label: {
                        Text("로그아웃")
                            .font(.caption)
                            .foregroundStyle(.onSurfaceVariant)
                    }
                }
            }
            .navigationTitle("마이페이지")
            .navigationBarTitleDisplayMode(.inline)
            .surface()
        }
    }
}

#Preview {
    MyPageView()
        .environmentObject(UserModel())
}
