import Foundation

protocol UserModelProtocol {
    func fromGetUserDTO(dto: GetUserResDTO)
}

class UserModel: ObservableObject, UserModelProtocol {
    @Published var time: Int = 0
    @Published var distance: Int = 0

    func fromGetUserDTO(dto: GetUserResDTO) {
        time = dto.walkTime
        distance = dto.walkDistance
    }
}