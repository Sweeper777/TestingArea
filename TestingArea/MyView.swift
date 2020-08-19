import UIKit

@IBDesignable class CustomView: UIView {
    
    private lazy var shapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        shapeLayer.frame = bounds
        shapeLayer.fillColor = UIColor.black.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 3
        layer.addSublayer(shapeLayer)
        
    }
    
    override func layoutSubviews() {
        
        shapeLayer.path = drawSunShape(bounds)
    }
    private func drawSunShape(_ group:CGRect) -> CGPath {
        let bezierPath = UIBezierPath()
        let radius = group.maxX/2
        let center =  CGPoint(x: group.midX, y: group.midY)
        bezierPath.addArc(withCenter:center, radius: radius, startAngle: -.pi/2, endAngle: 3 * .pi * 0.5 , clockwise: true)
        return bezierPath.cgPath
    }
    
    private func drawMoonShape(_ group:CGRect) -> CGPath {
         
         let big = UIBezierPath()

        big.addArc(withCenter: CGPoint(x: group.midX, y: group.midY), radius: group.width / 2, startAngle:-.pi/2, endAngle: .pi/2.0, clockwise: true)
        big.addQuadCurve(to: CGPoint(x: group.width / 2, y: 0), controlPoint: CGPoint(x: group.width, y: group.width / 2))
//        big.apply(.init(rotationAngle: .pi / 4))
        
        
        return big.cgPath
    }
    func animateToOffShape()  {
        
        let anim = CABasicAnimation(keyPath: "path")
        anim.toValue = drawMoonShape(bounds)
        anim.duration = 5.0
        shapeLayer.add(anim, forKey: nil)
    }
}
