public enum AutoLayoutHasher {
    static func identificationSet(for constraint: AL.Constraint) -> Set<AnyHashable> {
        var set = Set<AnyHashable>()
        _ = set.insert(constraint.firstAnchor)
        if let anchor = constraint.secondAnchor {
            _ = set.insert(anchor)
        }
        _ = set.insert(constraint.relation)
        _ = set.insert(constraint.priority)
        return set
    }

    public static func identifier(for constraint: AL.Constraint) -> String {
        var hasher = Hasher()
        Self.identificationSet(for: constraint).hash(into: &hasher)
        return String(hasher.finalize())
    }

    public static func identifier(anchors: AL.XAxisAnchor..., relation: AL.Relation = .equal,
                                  priority: AL.Priority = .required) -> String {
        var set = Set<AnyHashable>()
        anchors.forEach { _ = set.insert($0) }
        _ = set.insert(relation)
        _ = set.insert(priority)
        var hasher = Hasher()
        set.hash(into: &hasher)
        return String(hasher.finalize())
    }

    public static func identifier(anchors: AL.YAxisAnchor..., relation: AL.Relation = .equal,
                                  priority: AL.Priority = .required) -> String {
        var set = Set<AnyHashable>()
        anchors.forEach { _ = set.insert($0) }
        _ = set.insert(relation)
        _ = set.insert(priority)
        var hasher = Hasher()
        set.hash(into: &hasher)
        return String(hasher.finalize())
    }

    public static func identifier(anchors: AL.Dimension..., relation: AL.Relation = .equal,
                                  priority: AL.Priority = .required) -> String {
        var set = Set<AnyHashable>()
        anchors.forEach { _ = set.insert($0) }
        _ = set.insert(relation)
        _ = set.insert(priority)
        var hasher = Hasher()
        set.hash(into: &hasher)
        return String(hasher.finalize())
    }

    public static func canReuse(constraint: AL.Constraint, for anchors: AL.XAxisAnchor...,
                                relation: AL.Relation = .equal, priority: AL.Priority = .required) -> Bool {
        let id = Self.identificationSet(for: constraint)

        var set = Set<AnyHashable>()
        anchors.forEach { _ = set.insert($0) }
        _ = set.insert(relation)
        _ = set.insert(priority)
        return id == set
    }

    public static func canReuse(constraint: AL.Constraint, for anchors: AL.YAxisAnchor...,
                                relation: AL.Relation = .equal, priority: AL.Priority = .required) -> Bool {
        let id = Self.identificationSet(for: constraint)

        var set = Set<AnyHashable>()
        anchors.forEach { _ = set.insert($0) }
        _ = set.insert(relation)
        _ = set.insert(priority)
        return id == set
    }

    public static func canReuse(constraint: AL.Constraint, for anchors: AL.Dimension...,
                                relation: AL.Relation = .equal, priority: AL.Priority = .required) -> Bool {
        let id = Self.identificationSet(for: constraint)

        var set = Set<AnyHashable>()
        anchors.forEach { _ = set.insert($0) }
        _ = set.insert(relation)
        _ = set.insert(priority)
        return id == set
    }
}
