import CoreGraphics

/// 支持通过 `NSLayoutDimension` 进行 Auto Layout 自适应尺寸的视图
public protocol AutoLayoutResizable: AutoLayoutCompatible {
    var heightAnchor: AL.Dimension { get }
    var widthAnchor: AL.Dimension { get }
}

public extension AutoLayoutResizable {
    /// 使用约束限制视图的尺寸。
    ///
    /// > Note: 此方法已被重命名为 ``autoLayout(fixedHeight:fixedWidth:)``。
    ///
    /// - Parameters:
    ///   - fixingHeight: 绝对高度
    ///   - fixingWidth: 绝对宽度
    /// - Returns: 高度、宽度两个约束
    @available(*, deprecated, renamed: "autoLayout(fixedHeight:fixedWidth:)")
    @discardableResult func autoLayout(
        fixingHeight height: CGFloat?, fixingWidth width: CGFloat?
    ) -> (
        height: AL.Constraint?, width: AL.Constraint?
    ) {
        self.autoLayout(fixedHeight: height, fixedWidth: width)
    }

    /// 使用约束限制视图的尺寸。
    ///
    /// 如果不需要启用任一约束，传递 `nil`。
    ///
    /// 此方法将设置绝对磅 (point) 尺寸约束，如需设置宽高比约束，使用 ``autoLayout(widthRatio:heightRatio:)``。
    ///
    /// - Parameters:
    ///   - height: 绝对高度
    ///   - width: 绝对宽度
    /// - Returns: 高度、宽度两个约束
    @discardableResult func autoLayout(
        fixedHeight height: CGFloat?, fixedWidth width: CGFloat?
    ) -> (
        height: AL.Constraint?, width: AL.Constraint?
    ) {
        var heightConstraint: AL.Constraint?
        var widthConstraint: AL.Constraint?
        for constraint in self.constraints {
            switch constraint.identifier {
            case AutoLayoutHasher.identifier(anchors: self.heightAnchor):
                heightConstraint = constraint
            case AutoLayoutHasher.identifier(anchors: self.widthAnchor):
                widthConstraint = constraint
            case AutoLayoutHasher.identifier(anchors: self.widthAnchor, self.heightAnchor):
                constraint.isActive = false
            default:
                continue
            }
        }

        if let constant = height {
            if let existing = heightConstraint {
                existing.constant = constant
            } else {
                heightConstraint = self.heightAnchor.constraint(equalToConstant: constant)
            }
            heightConstraint!.identifier = AutoLayoutHasher.identifier(for: heightConstraint!)
            heightConstraint!.isActive = true
        }

        if let constant = width {
            if let existing = widthConstraint {
                existing.constant = constant
            } else {
                widthConstraint = self.widthAnchor.constraint(equalToConstant: constant)
            }
            widthConstraint!.identifier = AutoLayoutHasher.identifier(for: widthConstraint!)
            widthConstraint!.isActive = true
        }

        if let element = self as? AL.View {
            element.translatesAutoresizingMaskIntoConstraints = false
        }

        return (heightConstraint, widthConstraint)
    }

    /// 使用约束限制视图的比例。
    ///
    /// 如果不需要启用任一约束，传递 `nil`。
    ///
    /// 此方法将设置允许缩放的比例尺寸，如需设置绝对尺寸，使用 ``autoLayout(fixedHeight:fixedWidth:)``。
    ///
    /// - Parameters:
    ///   - widthRatio: 宽度比值；例如 16:9 的视频中，宽度比值为 16
    ///   - heightRatio: 高度比值；例如 16:9 的视频中，高度比值为 9
    /// - Returns: 计算后的比例约束
    @discardableResult func autoLayout(widthRatio: CGFloat, heightRatio: CGFloat) -> AL.Constraint {
        var ratioConstraint: AL.Constraint?
        for constraint in self.constraints {
            switch constraint.identifier {
            case AutoLayoutHasher.identifier(anchors: self.heightAnchor),
                 AutoLayoutHasher.identifier(anchors: self.widthAnchor):
                constraint.isActive = false
            case AutoLayoutHasher.identifier(anchors: self.widthAnchor, self.heightAnchor):
                ratioConstraint = constraint
            default:
                continue
            }
        }

        if let existing = ratioConstraint {
            self.removeConstraint(existing)
        }

        ratioConstraint = self.widthAnchor.constraint(equalTo: self.heightAnchor,
                                                      multiplier: widthRatio / heightRatio)
        ratioConstraint!.identifier = AutoLayoutHasher.identifier(for: ratioConstraint!)
        ratioConstraint!.isActive = true

        if let element = self as? AL.View {
            element.translatesAutoresizingMaskIntoConstraints = false
        }

        return ratioConstraint!
    }
}
