import UIKit

@IBDesignable
class CrossHair: UIView {
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
        UIColor.black.setStroke()
        path.stroke()
    }
}
