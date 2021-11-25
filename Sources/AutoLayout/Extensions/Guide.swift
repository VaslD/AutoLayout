// MARK: - AL.Guide + AutoLayoutCompatible

extension AL.Guide: AutoLayoutCompatible {
    public var constraints: [AL.Constraint] {
        self.constraintsAffectingLayout(for: .horizontal) + self.constraintsAffectingLayout(for: .vertical)
    }

    public func addConstraint(_ constraint: AL.Constraint) {
        self.owningView?.addConstraint(constraint)
    }

    public func removeConstraint(_ constraint: AL.Constraint) {
        self.owningView?.removeConstraint(constraint)
    }
}

// MARK: - AL.Guide + AutoLayoutElement

extension AL.Guide: AutoLayoutElement {}

// MARK: - AL.Guide + AutoLayoutResizable

extension AL.Guide: AutoLayoutResizable {}
