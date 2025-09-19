import Foundation
import SwiftUI

final class SessionManager {
    private let userModel: UserModel
    private let courseModel: CourseModel
    private let dialogManager: DialogManager

    init(userModel: UserModel, courseModel: CourseModel, dialogManager: DialogManager) {
        self.userModel = userModel
        self.courseModel = courseModel
        self.dialogManager = dialogManager
    }

    func bootstrapAfterSignIn() {
        UserService.shared.getUser { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let dto):
                self.userModel.fromGetUserDTO(dto: dto)
            case .failure(let error):
                DispatchQueue.main.async {
                    self.dialogManager.show(.dialog(type: .error(message: error.localizedDescription)))
                }
            }
        }

        CourseService.shared.getCourses { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let coursesDTO):
                self.courseModel.fromGetCoursesDTO(dto: coursesDTO)
            case .failure(let error):
                DispatchQueue.main.async {
                    self.dialogManager.show(.dialog(type: .error(message: error.localizedDescription)))
                }
            }
        }
    }
}
