import protocol ObjectiveC.NSObjectProtocol

/// 支持 Auto Layout 约束的视图
public protocol AutoLayoutCompatible: NSObjectProtocol {
    var constraints: [AL.Constraint] { get }

    func addConstraint(_ constraint: AL.Constraint)
    func removeConstraint(_ constraint: AL.Constraint)
}
