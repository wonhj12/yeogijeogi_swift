import Foundation

enum Configuration {
    static func value<T>(for key: String) -> T? where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            return nil
        }

        switch object {
            case let value as T:
                return value
            case let string as String:
                return T(string)
            default:
                return nil
        }
    }
}
