import SwiftUI

struct CustomDialog: View {
    @Binding var isPresented: Bool
    var type: DialogType
    var action: () -> Void = {}

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

                if type != .error {
                    Button {
                        isPresented = false
                    } label: {
                        Text("취소")
                            .font(.callout)
                            .foregroundStyle(.onSurfaceVariant)
                    }
                }

                Button {
                    if type == .error {
                        action()
                    }
                    isPresented = false
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
    CustomDialog(isPresented: .constant(false), type: .logout)
}

struct CustomDialogModifier: ViewModifier {
    @Binding var isPresented: Bool
    var dialogType: DialogType
    var action: () -> Void = {}

    func body(content: Content) -> some View {
        content.overlay {
            if isPresented {
                ZStack {
                    Color.onSurface.opacity(0.3)
                        .ignoresSafeArea()

                    CustomDialog(isPresented: $isPresented, type: dialogType, action: action)
                        .padding(.horizontal, 20)
                }
            }
        }
    }
}

extension View {
    func showCustomDialog(isPresented: Binding<Bool>, dialogType: DialogType, action: @escaping () -> Void = {}) -> some View {
        modifier(
            CustomDialogModifier(
                isPresented: isPresented,
                dialogType: dialogType,
                action: action
            )
        )
    }
}
