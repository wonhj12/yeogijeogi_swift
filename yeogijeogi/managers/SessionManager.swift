import Foundation
import SwiftUI

protocol SessionManagerProtocol {
    func bootstrapAfterSignIn()
}

final class SessionManager: SessionManagerProtocol {
    private let userModel: UserModelProtocol
    private let courseModel: CourseModelProtocol
    private let dialogManager: DialogManagerProtocol
    private let userService: UserServiceProtocol
    private let courseService: CourseServiceProtocol

    init(userModel: UserModelProtocol, courseModel: CourseModelProtocol, dialogManager: DialogManagerProtocol, userService: UserServiceProtocol, courseService: CourseServiceProtocol) {
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