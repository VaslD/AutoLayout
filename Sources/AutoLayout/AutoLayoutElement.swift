/// 支持通过 `NSLayoutAnchor` 进行 Auto Layout 布局的视图
public protocol AutoLayoutElement: AutoLayoutCompatible {
    var topAnchor: AutoLayoutYAxisAnchor { get }
    var bottomAnchor: AutoLayoutYAxisAnchor { get }

    var leadingAnchor: AutoLayoutXAxisAnchor { get }
    var trailingAnchor: AutoLayoutXAxisAnchor { get }
    var leftAnchor: AutoLayoutXAxisAnchor { get }
    var rightAnchor: AutoLayoutXAxisAnchor { get }

    var centerXAnchor: AutoLayoutXAxisAnchor { get }
    var centerYAnchor: AutoLayoutYAxisAnchor { get }
}
