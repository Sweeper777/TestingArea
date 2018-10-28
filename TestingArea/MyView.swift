import UIKit

class MyView: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: 0, y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.midX, y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.midX, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        UIColor.red.setFill()
        path.fill()
    }
    
}
