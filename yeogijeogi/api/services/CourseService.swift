//
//  CourseService.swift
//  yeogijeogi
//
//  Created by hajin on 9/19/25.
//

import Foundation

protocol CourseServiceProtocol {
    func getCourses(completion: @escaping (Result<GetCoursesResDTO, Error>) -> Void)
}

class CourseService: CourseServiceProtocol {

    init() {}

    func getCourses(completion: @escaping (Result<GetCoursesResDTO, Error>) -> Void) {
        APIService.request(CourseRouter.getCourses) { (result: Result<GetCoursesResDTO, APIError>) in
            completion(result.mapError { $0 as Error })
        }
    }
}
