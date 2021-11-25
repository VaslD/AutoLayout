import os

public extension AL.Constraint {
    /// 启用约束并返回已启用的约束。适合函数式编程。
    @discardableResult func activated() -> Self {
        self.isActive = true
        return self
    }

    /// 停用约束并返回已停用的约束。适合函数式编程。
    @discardableResult func deactivated() -> Self {
        self.isActive = false
        return self
    }

    /// 为当前约束设置优先级并返回设置后的约束。通常用在 `NSALLayoutConstraint.activate(_:)` 数组中。
    ///
    /// - 约束默认为必须约束（优先级 1000），因此不需要设置 `.required` 或 1000 优先级。
    /// - 当约束生效后，不再可以调整必须约束的优先级；也不可以再将可选约束设置为必须。
    /// - 约束优先级大于 0。
    ///
    /// - Parameter priority: 约束优先级，大于 0 且小于 `.required`
    /// - Returns: 设置后的约束
    @discardableResult func settingPriority(_ priority: AL.Priority) -> Self {
        guard priority.rawValue > 0 else {
#if DEBUG
            print("不能为约束指定小于或等于 0 的优先级。")
            // 触发调试器断点
            raise(SIGINT)
#endif
            return self
        }

        guard priority < .required, self.priority != .required else {
#if DEBUG
            print("不能通过调整优先级将可选约束设置为必须约束，反之亦然。")
            // 触发调试器断点
            raise(SIGINT)
#endif
            return self
        }

        self.priority = priority
        return self
    }
}

public extension Sequence where Element: AL.Constraint {
    /// 启用所有约束并返回约束数组。适合函数式编程。
    @discardableResult func activated() -> Self {
        self.forEach { $0.isActive = true }
        return self
    }

    /// 停用约束并返回约束数组。适合函数式编程。
    @discardableResult func deactivated() -> Self {
        self.forEach { $0.isActive = false }
        return self
    }
}

public extension Array where Element: AL.Constraint {
    /// 将所有约束添加到视图并返回约束数组。适合函数式编程。
    ///
    /// - Parameter view: 管理约束的父视图
    @discardableResult func added(to view: AL.View) -> Self {
        view.addConstraints(self)
        return self
    }
}
