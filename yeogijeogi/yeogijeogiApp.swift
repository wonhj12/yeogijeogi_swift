//
//  yeogijeogiApp.swift
//  yeogijeogi
//
//  Created by hajin on 8/26/25.
//

import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct yeogijeogiApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    @StateObject private var router: Router
    @StateObject private var dialogManager: DialogManager
    @StateObject private var authenticator: Authenticator

    // Models
    @StateObject private var userModel: UserModel
    @StateObject private var courseModel: CourseModel
    @State private var sessionManager: SessionManager? = nil

    init() {
        let userModel = UserModel()
        let courseModel = CourseModel()

        let dialogManager = DialogManager()
        let userService = UserService()
        let courseService = CourseService()
        let authenticator = Authenticator(dialogManager: dialogManager, userService: userService)
        let sessionManager = SessionManager(userModel: userModel, courseModel: courseModel, dialogManager: dialogManager, userService: userService, courseService: courseService)
        let router = Router()

        _dialogManager = StateObject(wrappedValue: dialogManager)
        _authenticator = StateObject(wrappedValue: authenticator)
        _router = StateObject(wrappedValue: router)
        _userModel = StateObject(wrappedValue: userModel)
        _courseModel = StateObject(wrappedValue: courseModel)
        _sessionManager = State(initialValue: sessionManager)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
                .environmentObject(authenticator)
                .environmentObject(dialogManager)
                .environmentObject(userModel)
                .environmentObject(courseModel)
                .onAppear { authenticator.checkSignState() }
                .onChange(of: authenticator.signState) { _, newValue in
                    if newValue == .signIn {
                        sessionManager?.bootstrapAfterSignIn()
                    }
                }
        }
    }
}
