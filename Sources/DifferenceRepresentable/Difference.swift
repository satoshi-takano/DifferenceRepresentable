public struct Difference {
    public let keys: [AnyHashable]
    public let values: [AnyHashable?]

    internal init(keys: [AnyHashable], values: [AnyHashable?]) {
        guard Set(keys).count == keys.count else {
            fatalError("keys should contain unique values")
        }
        self.keys = keys
        self.values = values
    }

    subscript(key: AnyHashable) -> AnyHashable? {
        get {
            guard let index = keys.firstIndex(of: key) else {
                return nil
            }
            return values[index]
        }
    }
}
