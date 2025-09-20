import Foundation
import SwiftUI

final class SessionManager {
    private let userModel: UserModel
    private let courseModel: CourseModel
    private let dialogManager: DialogManager
    private let userService: UserServiceProtocol
    private let courseService: CourseServiceProtocol

    init(userModel: UserModel, courseModel: CourseModel, dialogManager: DialogManager, userService: UserServiceProtocol, courseService: CourseServiceProtocol) {
        self.userModel = userModel
        self.courseModel = courseModel
        self.dialogManager = dialogManager
        self.userService = userService
        self.courseService = courseService
    }

    func bootstrapAfterSignIn() {
        userService.getUser { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let dto):
                DispatchQueue.main.async {
                    self.userModel.fromGetUserDTO(dto: dto)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.dialogManager.show(.dialog(type: .error(message: error.localizedDescription)))
                }
            }
        }

        courseService.getCourses { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let coursesDTO):
                DispatchQueue.main.async {
                    self.courseModel.fromGetCoursesDTO(dto: coursesDTO)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.dialogManager.show(.dialog(type: .error(message: error.localizedDescription)))
                }
            }
        }
    }
}
