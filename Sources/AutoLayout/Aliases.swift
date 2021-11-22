#if os(macOS) && canImport(AppKit)

import class AppKit.NSLayoutAnchor
import class AppKit.NSLayoutConstraint
import class AppKit.NSLayoutDimension
import class AppKit.NSLayoutGuide
import class AppKit.NSLayoutXAxisAnchor
import class AppKit.NSLayoutYAxisAnchor
import class AppKit.NSView

public typealias AutoLayoutConstraint = NSLayoutConstraint
public typealias AutoLayoutPriority = NSLayoutConstraint.Priority
public typealias AutoLayoutRelation = NSLayoutConstraint.Relation
public typealias AutoLayoutDimension = NSLayoutDimension
public typealias AutoLayoutGuide = NSLayoutGuide
public typealias AutoLayoutAnchor = NSLayoutAnchor
public typealias AutoLayoutXAxisAnchor = NSLayoutXAxisAnchor
public typealias AutoLayoutYAxisAnchor = NSLayoutYAxisAnchor
public typealias AutoLayoutView = NSView

#elseif canImport(UIKit)

import class UIKit.NSLayoutAnchor
import class UIKit.NSLayoutConstraint
import class UIKit.NSLayoutDimension
import class UIKit.NSLayoutXAxisAnchor
import class UIKit.NSLayoutYAxisAnchor
import class UIKit.UILayoutGuide
import struct UIKit.UILayoutPriority
import class UIKit.UIView

public typealias AutoLayoutAnchor = NSLayoutAnchor
public typealias AutoLayoutConstraint = NSLayoutConstraint
public typealias AutoLayoutRelation = NSLayoutConstraint.Relation
public typealias AutoLayoutDimension = NSLayoutDimension
public typealias AutoLayoutXAxisAnchor = NSLayoutXAxisAnchor
public typealias AutoLayoutYAxisAnchor = NSLayoutYAxisAnchor
public typealias AutoLayoutGuide = UILayoutGuide
public typealias AutoLayoutPriority = UILayoutPriority
public typealias AutoLayoutView = UIView

#endif
