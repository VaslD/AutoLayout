// MARK: - AL.Priority + ExpressibleByFloatLiteral

extension AL.Priority: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Float) {
        self.init(rawValue: value)
    }
}

// MARK: - AL.Priority + ExpressibleByIntegerLiteral

extension AL.Priority: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(rawValue: Float(value))
    }
}
