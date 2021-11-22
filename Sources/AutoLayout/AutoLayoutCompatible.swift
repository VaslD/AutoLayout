import protocol ObjectiveC.NSObjectProtocol

/// 支持 Auto Layout 约束的视图
public protocol AutoLayoutCompatible: NSObjectProtocol {
    var constraints: [AutoLayoutConstraint] { get }

    func addConstraint(_ constraint: AutoLayoutConstraint)
    func removeConstraint(_ constraint: AutoLayoutConstraint)
}
