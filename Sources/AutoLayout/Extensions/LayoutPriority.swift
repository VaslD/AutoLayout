// MARK: - AutoLayoutPriority + ExpressibleByFloatLiteral

extension AutoLayoutPriority: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Float) {
        self.init(rawValue: value)
    }
}

// MARK: - AutoLayoutPriority + ExpressibleByIntegerLiteral

extension AutoLayoutPriority: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(rawValue: Float(value))
    }
}
