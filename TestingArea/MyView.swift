import UIKit
import SwiftyAnimate

@IBDesignable
class CrossHair: UIView {
    var touched = false
    
    override func draw(_ rect: CGRect) {
        let text = "Hello world" as NSString
        text.draw(in: rect, withAttributes: [:])
        
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
    
    var scaleUp: Animate {
        return (transform(duration: 0.1, transforms: [
            .rotate(angle: 180)
        ]).then(animation: transform(duration: 0.1, transforms: [
            .rotate(angle: 180)
        ]))).and(duration: 0.2) {
            self.width *= 2
            self.height *= 2
            self.x -= self.width / 4
            self.y -= self.height / 4
        }
    }
}
