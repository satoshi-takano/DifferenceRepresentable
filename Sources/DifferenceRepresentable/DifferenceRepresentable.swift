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
    func difference(from other: DifferenceRepresentable) -> Difference
}

extension DifferenceRepresentable {
    public func difference(from other: DifferenceRepresentable) -> Difference {
        guard let self = asDictionary(), let other = other.asDictionary() else {
            return Difference(keys: [], values: [])
        }
        let keys = self.differentPropertieKeys(from: other)
        let values = keys.map { self[$0] }
        return Difference(keys: keys, values: values)
    }
}
