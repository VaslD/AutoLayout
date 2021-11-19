/// 支持通过 `NSLayoutDimension` 进行 Auto Layout 自适应尺寸的视图
public protocol AutoLayoutResizable: AutoLayoutCompatible {
    var heightAnchor: AutoLayoutDimension { get }
    var widthAnchor: AutoLayoutDimension { get }
}
