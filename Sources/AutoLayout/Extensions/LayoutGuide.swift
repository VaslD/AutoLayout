// MARK: - AutoLayoutGuide + AutoLayoutCompatible

extension AutoLayoutGuide: AutoLayoutCompatible {
    public var constraints: [AutoLayoutConstraint] {
        self.constraintsAffectingLayout(for: .horizontal) + self.constraintsAffectingLayout(for: .vertical)
    }

    public func addConstraint(_ constraint: AutoLayoutConstraint) {
        self.owningView?.addConstraint(constraint)
    }

    public func removeConstraint(_ constraint: AutoLayoutConstraint) {
        self.owningView?.removeConstraint(constraint)
    }
}

// MARK: - AutoLayoutGuide + AutoLayoutElement

extension AutoLayoutGuide: AutoLayoutElement {}

// MARK: - AutoLayoutGuide + AutoLayoutResizable

extension AutoLayoutGuide: AutoLayoutResizable {}
