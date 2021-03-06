import CoreGraphics

public extension AutoLayoutElement {
    /// 将当前视图通过边距约束固定在容器中。
    ///
    /// 如需启用约束但不保留边距，必须传递 `0`；如果不希望启用对应侧边距，传递
    /// `nil`。此函数不会删除视图上现有约束或修改其优先级，滥用可能导致无法同时满足约束。
    ///
    /// - Note:
    /// 请仔细阅读参数说明并对照 UI 设计文档。在绝大多数情况下，视图下方和右侧的边距应该传递负值。
    ///
    /// - Parameters:
    ///   - view: 容器视图
    ///   - top: 顶部边距，向上为负、向下为正
    ///   - bottom: 底部边距，向上为负、向下为正
    ///   - leading: 阅读顺序方向（左侧）边距，向左为负、向右为正
    ///   - trailing: 阅读逆序方向（右侧）边距，向左为负、向右为正
    /// - Returns: 上、下、「左」、「右」四个可选值约束
    @discardableResult func autoLayout(
        in view: AutoLayoutElement,
        top: CGFloat?, bottom: CGFloat?, leading: CGFloat?, trailing: CGFloat?
    ) -> (
        top: AutoLayoutConstraint?, bottom: AutoLayoutConstraint?,
        leading: AutoLayoutConstraint?, trailing: AutoLayoutConstraint?
    ) {
        var constraints = [AutoLayoutConstraint]()
        var topConstraint: AutoLayoutConstraint?
        var bottomConstraint: AutoLayoutConstraint?
        var leadingConstraint: AutoLayoutConstraint?
        var trailingConstraint: AutoLayoutConstraint?

        if let constant = top {
            topConstraint = self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant)
            constraints.append(topConstraint!)
        }
        if let constant = bottom {
            bottomConstraint = self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
            constraints.append(bottomConstraint!)
        }

        if let constant = leading {
            leadingConstraint = self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant)
            constraints.append(leadingConstraint!)
        }
        if let constant = trailing {
            trailingConstraint = self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant)
            constraints.append(trailingConstraint!)
        }

        if let element = self as? AutoLayoutView {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        AutoLayoutConstraint.activate(constraints)
        return (topConstraint, bottomConstraint, leadingConstraint, trailingConstraint)
    }

    /// 将当前视图通过边距约束固定在容器中，但自动添加中轴约束保持横向居中。
    ///
    /// 此函数类似 ``autoLayout(in:top:bottom:leading:trailing:)`` 但左右两侧的边距约束仅在保持横向居中后满足。
    ///
    /// 如需启用约束但不保留边距，必须传递 `0`；如果不希望启用对应侧边距，传递
    /// `nil`。此函数不会删除视图上现有约束或修改其优先级，滥用可能导致无法同时满足约束。
    ///
    /// - Note:
    /// 请仔细阅读参数说明并对照 UI 设计文档。在绝大多数情况下，视图下方和右侧的边距应该传递负值。
    ///
    /// - Parameters:
    ///   - view: 容器视图
    ///   - top: 顶部边距，向上为负、向下为正
    ///   - bottom: 底部边距，向上为负、向下为正
    ///   - leading: 阅读顺序方向（左侧）边距，向左为负、向右为正
    ///   - trailing: 阅读逆序方向（右侧）边距，向左为负、向右为正
    /// - Returns: 上、下、「左」、横向中轴、「右」五个约束
    @discardableResult func autoLayout(
        horizontallyCenteredIn view: AutoLayoutElement,
        top: CGFloat?, bottom: CGFloat?, leading: CGFloat?, trailing: CGFloat?
    ) -> (
        top: AutoLayoutConstraint?, bottom: AutoLayoutConstraint?,
        leading: AutoLayoutConstraint?, centerX: AutoLayoutConstraint?, trailing: AutoLayoutConstraint?
    ) {
        var constraints = [AutoLayoutConstraint]()
        var topConstraint: AutoLayoutConstraint?
        var bottomConstraint: AutoLayoutConstraint?
        var leadingConstraint: AutoLayoutConstraint?
        var centerXConstraint: AutoLayoutConstraint?
        var trailingConstraint: AutoLayoutConstraint?

        if let constant = top {
            topConstraint = self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant)
            constraints.append(topConstraint!)
        }
        if let constant = bottom {
            bottomConstraint = self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
            constraints.append(bottomConstraint!)
        }

        if let constant = leading {
            leadingConstraint = self.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor,
                                                              constant: constant)
            constraints.append(leadingConstraint!)
        }
        if let constant = trailing {
            trailingConstraint = self.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor,
                                                                constant: constant)
            constraints.append(trailingConstraint!)
        }

        centerXConstraint = self.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        constraints.append(centerXConstraint!)

        if let element = self as? AutoLayoutView {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        AutoLayoutConstraint.activate(constraints)
        return (topConstraint, bottomConstraint, leadingConstraint, centerXConstraint, trailingConstraint)
    }

    /// 将当前视图通过边距约束固定在容器中，但自动添加中轴约束保持纵向居中。
    ///
    /// 此函数类似 ``autoLayout(in:top:bottom:leading:trailing:)`` 但上下两侧的边距约束仅在保持纵向居中后满足。
    ///
    /// 如需启用约束但不保留边距，必须传递 `0`；如果不希望启用对应侧边距，传递
    /// `nil`。此函数不会删除视图上现有约束或修改其优先级，滥用可能导致无法同时满足约束。
    ///
    /// - Note:
    /// 请仔细阅读参数说明并对照 UI 设计文档。在绝大多数情况下，视图下方和右侧的边距应该传递负值。
    ///
    /// - Parameters:
    ///   - view: 容器视图
    ///   - top: 顶部边距，向上为负、向下为正
    ///   - bottom: 底部边距，向上为负、向下为正
    ///   - leading: 阅读顺序方向（左侧）边距，向左为负、向右为正
    ///   - trailing: 阅读逆序方向（右侧）边距，向左为负、向右为正
    /// - Returns: 上、纵向中轴、下、「左」、「右」五个约束
    @discardableResult func autoLayout(
        verticallyCenteredIn view: AutoLayoutElement,
        top: CGFloat?, bottom: CGFloat?, leading: CGFloat?, trailing: CGFloat?
    ) -> (
        top: AutoLayoutConstraint?, centerY: AutoLayoutConstraint?, bottom: AutoLayoutConstraint?,
        leading: AutoLayoutConstraint?, trailing: AutoLayoutConstraint?
    ) {
        var constraints = [AutoLayoutConstraint]()
        var topConstraint: AutoLayoutConstraint?
        var centerYConstraint: AutoLayoutConstraint?
        var bottomConstraint: AutoLayoutConstraint?
        var leadingConstraint: AutoLayoutConstraint?
        var trailingConstraint: AutoLayoutConstraint?

        if let constant = top {
            topConstraint = self.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor,
                                                      constant: constant)
            constraints.append(topConstraint!)
        }
        if let constant = bottom {
            bottomConstraint = self.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor,
                                                            constant: constant)
            constraints.append(bottomConstraint!)
        }
        centerYConstraint = self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        constraints.append(centerYConstraint!)

        if let constant = leading {
            leadingConstraint = self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant)
            constraints.append(leadingConstraint!)
        }
        if let constant = trailing {
            trailingConstraint = self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant)
            constraints.append(trailingConstraint!)
        }

        if let element = self as? AutoLayoutView {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        AutoLayoutConstraint.activate(constraints)
        return (topConstraint, centerYConstraint, bottomConstraint, leadingConstraint, trailingConstraint)
    }

    /// 将当前视图通过边距约束固定在容器中，但自动添加中轴约束保持横向和纵向居中。
    ///
    /// 此函数类似 ``autoLayout(in:top:bottom:leading:trailing:)`` 但所有边距约束仅在保持整体居中后满足。
    ///
    /// 如需启用约束但不保留边距，必须传递 `0`；如果不希望启用对应侧边距，传递
    /// `nil`。此函数不会删除视图上现有约束或修改其优先级，滥用可能导致无法同时满足约束。
    ///
    /// - Note:
    /// 请仔细阅读参数说明并对照 UI 设计文档。在绝大多数情况下，视图下方和右侧的边距应该传递负值。
    ///
    /// - Parameters:
    ///   - view: 容器视图
    ///   - top: 顶部边距，向上为负、向下为正
    ///   - bottom: 底部边距，向上为负、向下为正
    ///   - leading: 阅读顺序方向（左侧）边距，向左为负、向右为正
    ///   - trailing: 阅读逆序方向（右侧）边距，向左为负、向右为正
    /// - Returns: 上、纵向中轴、下、「左」、横向中轴、「右」六个约束
    @discardableResult func autoLayout(
        centeredIn view: AutoLayoutElement,
        top: CGFloat?, bottom: CGFloat?, leading: CGFloat?, trailing: CGFloat?
    ) -> (
        top: AutoLayoutConstraint?, centerY: AutoLayoutConstraint?, bottom: AutoLayoutConstraint?,
        leading: AutoLayoutConstraint?, centerX: AutoLayoutConstraint?, trailing: AutoLayoutConstraint?
    ) {
        let (topConstraint, centerYConstraint, bottomConstraint, _, _) =
            self.autoLayout(verticallyCenteredIn: view, top: top, bottom: bottom, leading: nil, trailing: nil)
        let (_, _, leadingConstraint, centerXConstraint, trailingConstraint) =
            self.autoLayout(horizontallyCenteredIn: view, top: nil, bottom: nil, leading: leading, trailing: trailing)
        return (topConstraint, centerYConstraint, bottomConstraint,
                leadingConstraint, centerXConstraint, trailingConstraint)
    }

    /// 精细控制当前视图周围的 `NSLayoutAnchor`。
    ///
    /// - Note:
    /// 请仔细阅读参数说明并对照 UI 设计文档。在绝大多数情况下，视图下方和右侧的边距应该传递负值。
    ///
    /// - Parameters:
    ///   - topAnchor: 视图上方衔接的 `NSLayoutAnchor`
    ///   - topMargin: 当前视图距离上方 Anchor 的距离，向上为负、向下为正
    ///   - topPriority: 上方约束的优先级
    ///   - bottomAnchor: 视图下方衔接的 `NSLayoutAnchor`
    ///   - bottomMargin: 当前视图距离下方 Anchor 的距离，向上为负、向下为正
    ///   - bottomPriority: 下方约束的优先级
    ///   - leadingAnchor: 视图在阅读顺序方向（左侧）衔接的 `NSLayoutAnchor`
    ///   - leadingMargin: 当前视图距离「左」侧 Anchor 的距离，向左为负、向右为正
    ///   - leadingPriority: 「左」侧约束的优先级
    ///   - trailingAnchor: 视图在阅读逆序方向（右侧）衔接的 `NSLayoutAnchor`
    ///   - trailingMargin: 当前视图距离「右」侧 Anchor 的距离，向左为负、向右为正
    ///   - trailingPriority: 「右」侧约束的优先级
    /// - Returns: 上、下、「左」、「右」四个可选值约束
    @discardableResult func autoLayout(
        topAnchor: AutoLayoutYAxisAnchor? = nil, topMargin: CGFloat = 0,
        topPriority: AutoLayoutPriority = .required,
        bottomAnchor: AutoLayoutYAxisAnchor? = nil, bottomMargin: CGFloat = 0,
        bottomPriority: AutoLayoutPriority = .required,
        leadingAnchor: AutoLayoutXAxisAnchor? = nil, leadingMargin: CGFloat = 0,
        leadingPriority: AutoLayoutPriority = .required,
        trailingAnchor: AutoLayoutXAxisAnchor? = nil, trailingMargin: CGFloat = 0,
        trailingPriority: AutoLayoutPriority = .required
    ) -> (
        top: AutoLayoutConstraint?, bottom: AutoLayoutConstraint?,
        leading: AutoLayoutConstraint?, trailing: AutoLayoutConstraint?
    ) {
        var constraints = [AutoLayoutConstraint]()
        var topConstraint: AutoLayoutConstraint?
        var bottomConstraint: AutoLayoutConstraint?
        var leadingConstraint: AutoLayoutConstraint?
        var trailingConstraint: AutoLayoutConstraint?

        if let top = topAnchor {
            topConstraint = self.topAnchor.constraint(equalTo: top, constant: topMargin)
            topConstraint!.priority = topPriority
            constraints.append(topConstraint!)
        }
        if let bottom = bottomAnchor {
            bottomConstraint = self.bottomAnchor.constraint(equalTo: bottom, constant: bottomMargin)
            bottomConstraint!.priority = bottomPriority
            constraints.append(bottomConstraint!)
        }

        if let leading = leadingAnchor {
            leadingConstraint = self.leadingAnchor.constraint(equalTo: leading, constant: leadingMargin)
            leadingConstraint!.priority = leadingPriority
            constraints.append(leadingConstraint!)
        }
        if let trailing = trailingAnchor {
            trailingConstraint = self.trailingAnchor.constraint(equalTo: trailing, constant: trailingMargin)
            trailingConstraint!.priority = trailingPriority
            constraints.append(trailingConstraint!)
        }

        if let element = self as? AutoLayoutView {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        AutoLayoutConstraint.activate(constraints)
        return (topConstraint, bottomConstraint, leadingConstraint, trailingConstraint)
    }
}

public extension AutoLayoutResizable {
    /// 使用约束限制视图的尺寸。
    ///
    /// 如果不需要启用任一约束，传递 `nil`。
    ///
    /// 此函数将设置绝对磅 (point) 尺寸约束，如需设置宽高比约束，使用 ``autoLayout(widthRatio:heightRatio:)``。
    ///
    /// - Parameters:
    ///   - fixingHeight: 绝对高度
    ///   - fixingWidth: 绝对宽度
    /// - Returns: 高度、宽度两个约束
    @discardableResult func autoLayout(
        fixingHeight: CGFloat?, fixingWidth: CGFloat?
    ) -> (
        height: AutoLayoutConstraint?, width: AutoLayoutConstraint?
    ) {
        var constraints = [AutoLayoutConstraint]()
        var height: AutoLayoutConstraint?
        var width: AutoLayoutConstraint?

        if let heightValue = fixingHeight {
            height = self.heightAnchor.constraint(equalToConstant: heightValue)
            constraints.append(height!)
        }
        if let widthValue = fixingWidth {
            width = self.widthAnchor.constraint(equalToConstant: widthValue)
            constraints.append(width!)
        }

        if let element = self as? AutoLayoutView {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        AutoLayoutConstraint.activate(constraints)
        return (height, width)
    }

    /// 使用约束限制视图的比例。
    ///
    /// 如果不需要启用任一约束，传递 `nil`。
    ///
    /// 此函数将设置允许缩放的比例尺寸，如需设置绝对尺寸，使用 ``autoLayout(fixingHeight:fixingWidth:)``。
    ///
    /// - Parameters:
    ///   - widthRatio: 宽度比值；例如 16:9 的视频中，宽度比值为 16
    ///   - heightRatio: 高度比值；例如 16:9 的视频中，高度比值为 9
    /// - Returns: 计算后的比例约束
    @discardableResult func autoLayout(widthRatio: CGFloat, heightRatio: CGFloat) -> AutoLayoutConstraint {
        let constraint = self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: widthRatio / heightRatio)
        if let element = self as? AutoLayoutView {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        constraint.isActive = true
        return constraint
    }
}
