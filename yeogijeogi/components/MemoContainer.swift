import SwiftUI

struct MemoContainer: View {
    @State var memo: String = ""

    init() {
        UITextView.appearance().textContainerInset =
            UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
    }

    var body: some View {
        TextEditor(text: $memo)
            .overlay(alignment: .topLeading) {
                Text("메모")
                    .foregroundStyle(memo.isEmpty ? .onSurfaceVariant : .clear)
                    .font(.body)
                    .padding(20)
            }
            .font(.body)
            .lineSpacing(6.8)
            .frame(height: 160)
            .cornerRadius(20)
    }
}

#Preview {
    MemoContainer()
}
