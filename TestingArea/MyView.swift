import UIKit

class MyView: UIView {
   
    override func draw(_ rect: CGRect) {
        let colors = [UIColor.red, .blue, .green, .red, .blue, .green, .red, .blue, .green, .red, .blue, .green]
        let bigCircleRect = self.bounds.insetBy(dx: 16, dy: 16)
        let bigCircle = UIBezierPath(ovalIn: bigCircleRect)
        bigCircle.lineWidth = 5
        UIColor.black.setStroke()
        bigCircle.stroke()
        
        for (index, angle) in stride(from: -CGFloat.pi, to: .pi - .pi / 6, by: .pi / 6).enumerated() {
            let centerOfCircle = CGPoint(x: (bigCircleRect.width / 2) * cos(angle) + bounds.width / 2,
                                         y: (bigCircleRect.width / 2) * sin(angle) + bounds.width / 2)
            let smallCircleRect = CGRect(origin: centerOfCircle, size: .zero).insetBy(dx: -16, dy: -16)
            let smallCircle = UIBezierPath(ovalIn: smallCircleRect)
            colors[index].setFill()
            smallCircle.fill()
            
        }
    }
}
