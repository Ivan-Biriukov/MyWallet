// MARK: - Imports

import UIKit

// MARK: - Style

enum Style {
    case leftUpperCorner
    case rightUpperCorner
}

// MARK: - StyleProperties

struct StyleProperties {
    var fillColor: CGColor
    var strokeColor: CGColor?
    var lineWidth: CGFloat?
    
    init(fillColor: CGColor, strokeColor: CGColor? = nil, lineWidth: CGFloat? = nil) {
        self.fillColor = fillColor
        self.strokeColor = strokeColor
        self.lineWidth = lineWidth
    }
}

// MARK: - ShapeView

final class ShapeView: UIView {

    // MARK: - Private Properties
    
    private let shapeLayer = CAShapeLayer()
    private var style: Style
    private var styleProperties: StyleProperties
    
    // MARK: - Init
    
    init(frame: CGRect, style: Style, styleProperties: StyleProperties) {
        self.style = style
        self.styleProperties = styleProperties
        super.init(frame: frame)
        testSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func testSetup() {
        shapeLayer.path = switch style {
        case .leftUpperCorner:
            createBezierPathLeftCorner().cgPath
        case .rightUpperCorner:
            createBezierPathRightCorner().cgPath
        }
        
        shapeLayer.strokeColor = styleProperties.strokeColor
        shapeLayer.fillColor = styleProperties.fillColor
        shapeLayer.lineWidth = styleProperties.lineWidth ?? 0
        shapeLayer.position = CGPoint(x: 0, y: 0)
        
        layer.addSublayer(shapeLayer)
    }
}

// MARK: - Create BezierPath methods

private extension ShapeView {

    func createBezierPathLeftCorner() -> UIBezierPath {
        let bezierPath = UIBezierPath()
        let widthScale = self.bounds.width / 346.97
        let heightScale = self.bounds.height / 392.55
        
        bezierPath.move(to: CGPoint(x: 41.66 * widthScale, y: 1.06 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 5.67 * widthScale, y: 26.86 * heightScale), controlPoint1: CGPoint(x: 25.98 * widthScale, y: 4.28 * heightScale), controlPoint2: CGPoint(x: 12.04 * widthScale, y: 14.26 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 0.64 * widthScale, y: 204.72 * heightScale), controlPoint1: CGPoint(x: 0.27 * widthScale, y: 37.66 * heightScale), controlPoint2: CGPoint(x: 0.19 * widthScale, y: 38.79 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 5.22 * widthScale, y: 362.69 * heightScale), controlPoint1: CGPoint(x: 1.09 * widthScale, y: 359.32 * heightScale), controlPoint2: CGPoint(x: 0.87 * widthScale, y: 353.24 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 37.38 * widthScale, y: 389.85 * heightScale), controlPoint1: CGPoint(x: 11.29 * widthScale, y: 375.97 * heightScale), controlPoint2: CGPoint(x: 22.09 * widthScale, y: 385.12 * heightScale))
        bezierPath.addLine(to: CGPoint(x: 43.53 * widthScale, y: 391.8 * heightScale))
        bezierPath.addLine(to: CGPoint(x: 108.39 * widthScale, y: 391.95 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 307.38 * widthScale, y: 391.2 * heightScale), controlPoint1: CGPoint(x: 307.38 * widthScale, y: 392.55 * heightScale), controlPoint2: CGPoint(x: 302.66 * widthScale, y: 392.55 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 327.7 * widthScale, y: 381.9 * heightScale), controlPoint1: CGPoint(x: 313.91 * widthScale, y: 389.32 * heightScale), controlPoint2: CGPoint(x: 321.78 * widthScale, y: 385.72 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 341.57 * widthScale, y: 369 * heightScale), controlPoint1: CGPoint(x: 332.88 * widthScale, y: 378.52 * heightScale), controlPoint2: CGPoint(x: 341.57 * widthScale, y: 370.42 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 343.9 * widthScale, y: 364.5 * heightScale), controlPoint1: CGPoint(x: 341.57 * widthScale, y: 368.62 * heightScale), controlPoint2: CGPoint(x: 342.62 * widthScale, y: 366.6 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 346.67 * widthScale, y: 356.77 * heightScale), controlPoint1: CGPoint(x: 345.32 * widthScale, y: 362.09 * heightScale), controlPoint2: CGPoint(x: 346.45 * widthScale, y: 359.17 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 346.97 * widthScale, y: 297.73 * heightScale), controlPoint1: CGPoint(x: 346.97 * widthScale, y: 354.59 * heightScale), controlPoint2: CGPoint(x: 347.05 * widthScale, y: 328.04 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 346.6 * widthScale, y: 187.84 * heightScale), controlPoint1: CGPoint(x: 346.82 * widthScale, y: 267.43 * heightScale), controlPoint2: CGPoint(x: 346.67 * widthScale, y: 217.92 * heightScale))
        bezierPath.addLine(to: CGPoint(x: 346.37 * widthScale, y: 133.08 * heightScale))
        bezierPath.addLine(to: CGPoint(x: 344.27 * widthScale, y: 127.83 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 332.05 * widthScale, y: 110.28 * heightScale), controlPoint1: CGPoint(x: 341.65 * widthScale, y: 121.3 * heightScale), controlPoint2: CGPoint(x: 336.7 * widthScale, y: 114.33 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 271.47 * widthScale, y: 82.37 * heightScale), controlPoint1: CGPoint(x: 325.75 * widthScale, y: 104.88 * heightScale), controlPoint2: CGPoint(x: 313.01 * widthScale, y: 99.03 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 253.47 * widthScale, y: 75.32 * heightScale), controlPoint1: CGPoint(x: 264.05 * widthScale, y: 79.45 * heightScale), controlPoint2: CGPoint(x: 255.95 * widthScale, y: 76.22 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 238.1 * widthScale, y: 68.95 * heightScale), controlPoint1: CGPoint(x: 251 * widthScale, y: 74.35 * heightScale), controlPoint2: CGPoint(x: 244.1 * widthScale, y: 71.5 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 214.93 * widthScale, y: 60.17 * heightScale), controlPoint1: CGPoint(x: 232.1 * widthScale, y: 66.39 * heightScale), controlPoint2: CGPoint(x: 221.68 * widthScale, y: 62.49 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 196.94 * widthScale, y: 53.42 * heightScale), controlPoint1: CGPoint(x: 208.19 * widthScale, y: 57.92 * heightScale), controlPoint2: CGPoint(x: 200.09 * widthScale, y: 54.84 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 184.87 * widthScale, y: 48.24 * heightScale), controlPoint1: CGPoint(x: 193.79 * widthScale, y: 51.99 * heightScale), controlPoint2: CGPoint(x: 188.39 * widthScale, y: 49.67 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 168.37 * widthScale, y: 41.57 * heightScale), controlPoint1: CGPoint(x: 181.34 * widthScale, y: 46.89 * heightScale), controlPoint2: CGPoint(x: 173.92 * widthScale, y: 43.89 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 146.63 * widthScale, y: 32.79 * heightScale), controlPoint1: CGPoint(x: 162.82 * widthScale, y: 39.32 * heightScale), controlPoint2: CGPoint(x: 153 * widthScale, y: 35.34 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 102.31 * widthScale, y: 15.24 * heightScale), controlPoint1: CGPoint(x: 140.25 * widthScale, y: 30.24 * heightScale), controlPoint2: CGPoint(x: 120.31 * widthScale, y: 22.36 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 51.85 * widthScale, y: 0.01 * heightScale), controlPoint1: CGPoint(x: 67.75 * widthScale, y: 1.58 * heightScale), controlPoint2: CGPoint(x: 62.2 * widthScale, y: -0.14 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 41.66 * widthScale, y: 1.06 * heightScale), controlPoint1: CGPoint(x: 48.93 * widthScale, y: 0.01 * heightScale), controlPoint2: CGPoint(x: 44.35 * widthScale, y: 0.53 * heightScale))
        bezierPath.close()
        
        return bezierPath
    }
    
    func createBezierPathRightCorner() -> UIBezierPath {
        let bezierPath = UIBezierPath()
        let widthScale = self.bounds.width / 392.23
        let heightScale = self.bounds.height / 391.95
        
        bezierPath.move(to: CGPoint(x: 383.38 * widthScale, y: 1.03 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 355.62 * widthScale, y: 9.28 * heightScale), controlPoint1: CGPoint(x: 377 * widthScale, y: 2.08 * heightScale), controlPoint2: CGPoint(x: 367.1 * widthScale, y: 5 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 201.12 * widthScale, y: 70.93 * heightScale), controlPoint1: CGPoint(x: 331.25 * widthScale, y: 18.35 * heightScale), controlPoint2: CGPoint(x: 224.98 * widthScale, y: 60.73 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 175.62 * widthScale, y: 80.75 * heightScale), controlPoint1: CGPoint(x: 195.58 * widthScale, y: 73.33 * heightScale), controlPoint2: CGPoint(x: 184.1 * widthScale, y: 77.75 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 146.38 * widthScale, y: 91.77 * heightScale), controlPoint1: CGPoint(x: 167.15 * widthScale, y: 83.68 * heightScale), controlPoint2: CGPoint(x: 154.03 * widthScale, y: 88.7 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 102.88 * widthScale, y: 109.25 * heightScale), controlPoint1: CGPoint(x: 138.73 * widthScale, y: 94.93 * heightScale), controlPoint2: CGPoint(x: 119.15 * widthScale, y: 102.73 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 23.38 * widthScale, y: 144.5 * heightScale), controlPoint1: CGPoint(x: 54.27 * widthScale, y: 128.6 * heightScale), controlPoint2: CGPoint(x: 32.53 * widthScale, y: 138.27 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 2.38 * widthScale, y: 172.25 * heightScale), controlPoint1: CGPoint(x: 15.12 * widthScale, y: 150.13 * heightScale), controlPoint2: CGPoint(x: 6.95 * widthScale, y: 160.93 * heightScale))
        bezierPath.addLine(to: CGPoint(x: -0.1 * widthScale, y: 178.48 * heightScale))
        bezierPath.addLine(to: CGPoint(x: -0.18 * widthScale, y: 328.93 * heightScale))
        bezierPath.addLine(to: CGPoint(x: -0.25 * widthScale, y: 479.38 * heightScale))
        bezierPath.addLine(to: CGPoint(x: 3.35 * widthScale, y: 486.5 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 20.08 * widthScale, y: 506 * heightScale), controlPoint1: CGPoint(x: 7.32 * widthScale, y: 494.23 * heightScale), controlPoint2: CGPoint(x: 11.38 * widthScale, y: 498.95 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 47.75 * widthScale, y: 520.63 * heightScale), controlPoint1: CGPoint(x: 26.23 * widthScale, y: 510.88 * heightScale), controlPoint2: CGPoint(x: 38.9 * widthScale, y: 517.63 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 72.88 * widthScale, y: 523.25 * heightScale), controlPoint1: CGPoint(x: 53.45 * widthScale, y: 522.58 * heightScale), controlPoint2: CGPoint(x: 54.73 * widthScale, y: 522.73 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 247.63 * widthScale, y: 523.4 * heightScale), controlPoint1: CGPoint(x: 83.38 * widthScale, y: 523.48 * heightScale), controlPoint2: CGPoint(x: 162.05 * widthScale, y: 523.55 * heightScale))
        bezierPath.addLine(to: CGPoint(x: 403.25 * widthScale, y: 523.1 * heightScale))
        bezierPath.addLine(to: CGPoint(x: 410.23 * widthScale, y: 520.85 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 454.55 * widthScale, y: 485.23 * heightScale), controlPoint1: CGPoint(x: 431.9 * widthScale, y: 514.03 * heightScale), controlPoint2: CGPoint(x: 445.55 * widthScale, y: 503 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 459.88 * widthScale, y: 455.38 * heightScale), controlPoint1: CGPoint(x: 458.3 * widthScale, y: 477.73 * heightScale), controlPoint2: CGPoint(x: 459.12 * widthScale, y: 473.3 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 460.7 * widthScale, y: 79.25 * heightScale), controlPoint1: CGPoint(x: 461 * widthScale, y: 429.28 * heightScale), controlPoint2: CGPoint(x: 461.75 * widthScale, y: 105.88 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 451.4 * widthScale, y: 31.48 * heightScale), controlPoint1: CGPoint(x: 459.5 * widthScale, y: 47.45 * heightScale), controlPoint2: CGPoint(x: 458.45 * widthScale, y: 42.05 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 417.12 * widthScale, y: 5.23 * heightScale), controlPoint1: CGPoint(x: 443.9 * widthScale, y: 20.23 * heightScale), controlPoint2: CGPoint(x: 431.3 * widthScale, y: 10.55 * heightScale))
        bezierPath.addCurve(to: CGPoint(x: 383.38 * widthScale, y: 1.03 * heightScale), controlPoint1: CGPoint(x: 406.78 * widthScale, y: 1.33 * heightScale), controlPoint2: CGPoint(x: 392.23 * widthScale, y: -0.47 * heightScale))
        bezierPath.close()
        
        return bezierPath
    }
}
