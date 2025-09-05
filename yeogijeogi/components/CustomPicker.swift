import SwiftUI

struct CustomPicker<Selection: Hashable>: View {
    @Binding var selection: Selection
    let type: TimePickerType

    var body: some View {
        Picker("", selection: $selection) {
            ForEach(
                Array(stride(from: 0, to: type.maxValue, by: type.stride)),
                id: \.self
            ) { values in
                Text("\(values)")
                    .font(.body)
                    .foregroundStyle(.onSurface)
                    .frame(width: 24)
                    .tag(values)
            }
        }
        .frame(width: 56)
        .pickerStyle(.wheel)
        .overlay {
            Text(type.label)
                .font(.body)
                .foregroundStyle(.onSurface)
                .offset(x: 40)
        }
    }
}

#Preview {
    CustomPicker(selection: .constant(0), type: .hour)
}
