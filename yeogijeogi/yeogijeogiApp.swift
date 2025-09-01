//
//  yeogijeogiApp.swift
//  yeogijeogi
//
//  Created by hajin on 8/26/25.
//

import SwiftUI

@main
struct yeogijeogiApp: App {
    @StateObject private var router = Router()

    var body: some Scene {
        WindowGroup {
//            LoginView()
            ContentView()
                .environmentObject(router)
        }
    }
}
