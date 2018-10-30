import UIKit
import Alamofire

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
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        print("point(inside:with:) called")
        
        func isInRegion(_ point: CGPoint) -> Bool {
            return (0...bounds.midX).contains(point.x) || (bounds.midY...bounds.maxY).contains(point.y)
        }
        
        return isInRegion(point)
    }
}
