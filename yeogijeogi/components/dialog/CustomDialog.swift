import SwiftUI

struct CustomDialog: View {
    var type: DialogType
    var action: () -> Void = {}
    var onDismiss: () -> Void = {}

    var body: some View {
        VStack {
            Text(type.title)
                .font(.headline)
                .foregroundStyle(.onSurface)
            Spacer()
                .frame(height: 24)

            Text(type.content)
                .font(.body)
                .foregroundStyle(.onSurface)
            Spacer()
                .frame(height: 24)

            HStack(spacing: 24) {
                Spacer()

                if type.hasCancelButton {
                    Button {
                        onDismiss()
                    } label: {
                        Text("취소")
                            .font(.callout)
                            .foregroundStyle(.onSurfaceVariant)
                    }
                }

                Button {
                    if type.hasCancelButton {
                        action()
                    }
                    onDismiss()
                } label: {
                    Text(type.primaryButtonTitle)
                        .font(.headline)
                        .foregroundStyle(type.primaryButtonColor)
                }
            }
        }
        .padding(20)
        .background(.surface)
        .clipShape(.rect(cornerRadius: 20))
        .shadow(color: .shadow, radius: 16)
    }
}

#Preview {
    CustomDialog(type: .logout)
}
