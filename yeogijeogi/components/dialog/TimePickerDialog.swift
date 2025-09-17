import SwiftUI

struct TimePickerDialog: View {
    @Binding var walkTime: Int

    @State private var hour: Int = 0
    @State private var minute: Int = 0

    var onDismiss: () -> Void = {}

    var body: some View {
        VStack(alignment: .trailing) {
            HStack(spacing: 40) {
                CustomPicker(selection: $hour, type: .hour)
                CustomPicker(selection: $minute, type: .minute)
            }
            .offset(x: -16)
            .padding(.horizontal, 40)

            Button {
                walkTime = hour * 60 + minute
                onDismiss()
            } label: {
                Text("완료")
                    .font(.headline)
                    .foregroundColor(.primaryGreen)
            }
            .padding(.bottom, 20)
            .padding(.horizontal, 20)
        }
        .background(.surface)
        .clipShape(.rect(cornerRadius: 20))
        .onAppear {
            hour = walkTime / 60
            minute = walkTime % 60
        }
        .onChange(of: hour) { validateSelection() }
        .onChange(of: minute) { validateSelection() }
    }

    // 0시간 0분으로 설정할 수 없도록 방지
    private func validateSelection() {
        if hour == 0, minute == 0 {
            withAnimation(.easeInOut) {
                minute = 5
            }
        }
    }
}

#Preview {
    TimePickerDialog(walkTime: .constant(30))
}
