//
//  GetCourseDTO.swift
//  yeogijeogi
//
//  Created by hajin on 9/19/25.
//

import Foundation

struct CoursePreview: Codable {
    var walkId: Int
    var longitude: Double
    var latitude: Double

    enum CodingKeys: String, CodingKey {
        case walkId = "walk_id"
        case longitude
        case latitude
    }
}

struct GetCoursesResDTO: Codable {
    var courses: [CoursePreview]
}
