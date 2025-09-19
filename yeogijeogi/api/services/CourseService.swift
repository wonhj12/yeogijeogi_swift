//
//  CourseService.swift
//  yeogijeogi
//
//  Created by hajin on 9/19/25.
//

import Foundation

class CourseService {
    static let shared = CourseService()

    private init() {}

    func getCourses(completion: @escaping (Result<GetCoursesResDTO, APIError>) -> Void) {
        APIService.request(CourseRouter.getCourses, completion: completion)
    }
}
