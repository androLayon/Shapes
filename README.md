# Shaped views

DTShapeView is a UIView subclass, that is backed by CAShapeLayer instead of CALayer. It provides API for changing CAShapeLayer path, fill and stroke colors and other layer properties, basically allowing UIView to behave like geometric shape.

All DTShapeView properties are automatically converted to CAShapeLayer properties or use CAShapeLayer properties directly. You can use whatever style you like, but we recommend using UIBezierPath and DTShapeView properties, because this allows you to completely bypass CoreFoundation objects. It also allows you to use CoreGraphics API instead of QuartzCore.

DTShapeView fully supports both explicit and implicit animation and hit testing inside it's path.
