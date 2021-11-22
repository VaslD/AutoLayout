extension AutoLayoutConstraint {
    func generateIdentifier() {
        var hasher = Hasher()
        self.firstAnchor.hash(into: &hasher)
        self.relation.hash(into: &hasher)
        self.secondAnchor?.hash(into: &hasher)
        self.priority.hash(into: &hasher)
        let hash = hasher.finalize()
        self.identifier = "vAsLd" + String(hash)
    }

    static func identifier<T: AnyObject>(firstAnchor: AutoLayoutAnchor<T>,
                                         relationship: AutoLayoutRelation = .equal,
                                         secondAnchor: AutoLayoutAnchor<T>? = nil,
                                         priority: AutoLayoutPriority = .required) -> String {
        var hasher = Hasher()
        firstAnchor.hash(into: &hasher)
        relationship.hash(into: &hasher)
        secondAnchor?.hash(into: &hasher)
        priority.hash(into: &hasher)
        let hash = hasher.finalize()
        return "vAsLd" + String(hash)
    }
}
