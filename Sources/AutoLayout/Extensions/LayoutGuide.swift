// MARK: - AutoLayoutGuide + AutoLayoutCompatible

extension AutoLayoutGuide: AutoLayoutCompatible {
    public var constraints: [AutoLayoutConstraint] {
        self.constraintsAffectingLayout(for: .horizontal) + self.constraintsAffectingLayout(for: .vertical)
    }
}

// MARK: - AutoLayoutGuide + AutoLayoutElement

extension AutoLayoutGuide: AutoLayoutElement {}

// MARK: - AutoLayoutGuide + AutoLayoutResizable

extension AutoLayoutGuide: AutoLayoutResizable {}
