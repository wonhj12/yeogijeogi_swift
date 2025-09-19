//
//  CourseRouter.swift
//  yeogijeogi
//
//  Created by hajin on 9/19/25.
//

import Alamofire
import Foundation

enum CourseRouter: RouterInterface {
    case getCourses

    var modulePath: String { "/course" }

    var path: String {
        switch self {
        case .getCourses:
            return "/"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getCourses:
            return .get
        }
    }

    var parameters: Parameters? {
        switch self {
        case .getCourses:
            return nil
        }
    }
}
