import SwiftUI

struct CustomTabView: View {
    @Binding var selectedTab: Tab

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 16)

            HStack {
                Spacer()

                ForEach(Tab.allCases, id: \.self) { tab in
                    Button {
                        self.selectedTab = tab
                    } label: {
                        VStack {
                            Image(tab.icon)
                                .tint(selectedTab == tab ? .onSurface : .onSurfaceVariant)
                            Spacer()
                                .frame(height: 8)

                            Text(tab.title)
                                .font(.caption)
                                .foregroundStyle(selectedTab == tab ? .onSurface : .onSurfaceVariant)
                        }
                    }
                    .frame(width: 52)

                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)

            Spacer()
        }
        .frame(height: 90)
        .background(.container)
        .clipShape(.rect(topLeadingRadius: 20, topTrailingRadius: 20))
    }
}

#Preview {
    CustomTabView(selectedTab: .constant(.walk))
}
