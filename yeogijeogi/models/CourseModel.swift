//
//  CourseModel.swift
//  yeogijeogi
//
//  Created by hajin on 9/19/25.
//

import Foundation

class CourseModel: ObservableObject {
    @Published var courses: [CoursePreview] = []

    func fromGetCoursesDTO(dto: GetCoursesResDTO) {
        courses = dto.courses
    }
}
