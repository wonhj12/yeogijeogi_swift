//
//  CourseModel.swift
//  yeogijeogi
//
//  Created by hajin on 9/19/25.
//

import Foundation

protocol CourseModelProtocol {
    func fromGetCoursesDTO(dto: GetCoursesResDTO)
}

class CourseModel: ObservableObject, CourseModelProtocol {
    @Published var courses: [CoursePreview] = []

    func fromGetCoursesDTO(dto: GetCoursesResDTO) {
        courses = dto.courses
    }
}