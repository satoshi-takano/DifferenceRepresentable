import Foundation

private extension Dictionary where Value: Equatable {
    func differentPropertieKeys(from dic: [Key: Value]) -> [Key] {
        return Set(Array(keys) + Array(dic.keys)).reduce(into: []) { result, key in
            if self[key] != dic[key] {
                result.append(key)
            }
        }
    }
}

public protocol DifferenceRepresentable: DictionaryRepresentable {
    func difference(between other: DifferenceRepresentable) -> [AnyHashable: AnyHashable]
}

extension DifferenceRepresentable {
    func difference(between other: DifferenceRepresentable) -> [AnyHashable: AnyHashable] {
        guard let self = asDictionary(), let other = other.asDictionary() else {
            return [:]
        }
        let keys = self.differentPropertieKeys(from: other)
        return keys.reduce(into: [:]) { result, key in
            result[key] = other[key]
        }
    }
}
