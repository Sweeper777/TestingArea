import UIKit

class MyView : UIView {
    private var sv: UIView!
    
    var hasBeenReflected: Bool {
        sv != nil && sv.superview == nil
    }
    
    public override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }

        let viewWidth = self.bounds.width
        let viewHeight = self.bounds.height

        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.beginPath()
        let path = CGMutablePath()
        let r = sqrt(viewHeight * viewHeight + viewWidth * viewWidth) * 0.50
        let p1 = CGPoint(x: viewWidth/2, y: 20 + r)
        var angle = CGFloat.pi * (90.0 + 30.0) / 180.0
        let p2 = CGPoint(x: p1.x + cos(angle) * r, y: p1.y - sin(angle) * r)
        angle = CGFloat.pi * 90.0 / 180.0
        let p3 = CGPoint(x: p1.x + cos(angle) * r, y: p1.y - sin(angle) * r)

        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.closeSubpath()

        context.addPath(path)
        context.strokePath()

        sv = UIView(frame:self.bounds)
        self.addSubview(sv)
        let  shapeLayer = CAShapeLayer.init()
        shapeLayer.path = path
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 1.0
        sv.layer.addSublayer(shapeLayer)
        shapeLayer.display()

        if hasBeenReflected {
            context.setStrokeColor(UIColor.red.cgColor)
            context.scaleBy(x: -1, y: 1)
            context.translateBy(x:-viewWidth, y:0)
            context.addPath(path)
            context.strokePath()
            context.scaleBy(x: -1, y: 1)
            context.translateBy(x:viewWidth, y:0)
        }
    }
    
    func reflect() {
        let trf =  CGAffineTransform(scaleX: -1, y: 1)
        UIView.animate(withDuration: 5, delay: 0, options: [], animations: {
            self.sv.transform = trf
        }) { _ in
            self.sv.removeFromSuperview()
            self.setNeedsDisplay()
        }
    }
}
