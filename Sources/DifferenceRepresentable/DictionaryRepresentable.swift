import Foundation

public protocol DictionaryRepresentable: Encodable {
    func asDictionary() -> [AnyHashable: AnyHashable]?
}

extension DictionaryRepresentable {
    public func asDictionary() -> [AnyHashable: AnyHashable]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        return try? JSONSerialization.jsonObject(
            with: data,
            options: []
        ) as? [AnyHashable: AnyHashable]
    }
}
