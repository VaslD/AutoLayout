public enum AL {}

#if os(macOS) && canImport(AppKit)

import class AppKit.NSLayoutAnchor
import class AppKit.NSLayoutConstraint
import class AppKit.NSLayoutDimension
import class AppKit.NSLayoutGuide
import class AppKit.NSLayoutXAxisAnchor
import class AppKit.NSLayoutYAxisAnchor
import class AppKit.NSView

public extension AL {
    typealias Anchor = NSLayoutAnchor
    typealias Constraint = NSLayoutConstraint
    typealias Dimension = NSLayoutDimension
    typealias Guide = NSLayoutGuide
    typealias Priority = NSLayoutConstraint.Priority
    typealias Relation = NSLayoutConstraint.Relation
    typealias View = NSView
    typealias XAxisAnchor = NSLayoutXAxisAnchor
    typealias YAxisAnchor = NSLayoutYAxisAnchor
}

#elseif canImport(UIKit)

import class UIKit.NSLayoutAnchor
import class UIKit.NSLayoutConstraint
import class UIKit.NSLayoutDimension
import class UIKit.NSLayoutXAxisAnchor
import class UIKit.NSLayoutYAxisAnchor
import class UIKit.UILayoutGuide
import struct UIKit.UILayoutPriority
import class UIKit.UIView

public extension AL {
    typealias Anchor = NSLayoutAnchor
    typealias Constraint = NSLayoutConstraint
    typealias Dimension = NSLayoutDimension
    typealias Guide = UILayoutGuide
    typealias Priority = UILayoutPriority
    typealias Relation = NSLayoutConstraint.Relation
    typealias View = UIView
    typealias XAxisAnchor = NSLayoutXAxisAnchor
    typealias YAxisAnchor = NSLayoutYAxisAnchor
}

#endif
