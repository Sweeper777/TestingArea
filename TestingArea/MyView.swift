import UIKit
import SwiftyAnimate

@IBDesignable
class CrossHair: UIView {
    var touched = false
    
    override func draw(_ rect: CGRect) {
        let newRect = CGRect(
            x: rect.x + rect.width / 4,
            y: rect.y + rect.height / 4,
            width: rect.width / 2,
            height: rect.height / 2
        )
        let path = UIBezierPath(ovalIn: newRect)
        let strokeWidth = min(rect.width, rect.height) * 0.05
        path.lineWidth = strokeWidth
        if touched {
            UIColor.red.setStroke()
        } else {
            UIColor.black.setStroke()
        }
        path.stroke()
        
        let horizontalLine = UIBezierPath()
        horizontalLine.move(to: CGPoint(x: rect.x, y: rect.midY))
        horizontalLine.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        horizontalLine.lineWidth = strokeWidth
        horizontalLine.stroke()
        
        let verticalLine = UIBezierPath()
        verticalLine.move(to: CGPoint(x: rect.midX, y: rect.y))
        verticalLine.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        verticalLine.lineWidth = strokeWidth
        verticalLine.stroke()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touched = true
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touched = false
        setNeedsDisplay()
    }
}

extension CrossHair {
    var fadeOut: Animate {
        return Animate(duration: 0.5, animationBlock: {
            self.alpha = 0
        }).do {
            self.removeFromSuperview()
        }
    }
}
