import Foundation

public protocol DictionaryRepresentable: Encodable {
    func asDictionary() -> [AnyHashable: AnyHashable]?
}

extension DictionaryRepresentable {
    private func propertyNames() -> [String] {
        return Mirror(reflecting: self).children.compactMap { $0.label }
    }

    private func value(for key: String) -> AnyHashable? {
        let m = Mirror(reflecting: self)
        let properties = Array(m.children)
        return properties.first { $0.label == key }?.value as? AnyHashable
    }

    public func asDictionary() -> [AnyHashable: AnyHashable]? {
        propertyNames().reduce(into: [:]) { result, key in
            result[key] = value(for: key)
        }
    }
}
