import SwiftUI

@MainActor
class Router: ObservableObject {
    @Published var tab: Tab = .walk {
        didSet {
            if oldValue != tab {
                path.removeAll()
            }
        }
    }

    @Published var path: [Route] = []
}
