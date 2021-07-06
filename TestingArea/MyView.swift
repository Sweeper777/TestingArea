import UIKit
import SwiftyUtils

class TwoCirclesView: UIView {
    var stationaryCircleRadius: CGFloat = 120
    var movingCircleRadius: CGFloat = 40
    var roll = true
    var position: CGFloat = 0
    var turn: CGFloat = 0
    var speed: CGFloat = 1
    
    @objc func update() {
        if roll {
            updateTurn()
        }
        position += speed
        setNeedsDisplay()
    }
    
    private func degToRad(_ deg: CGFloat) -> CGFloat {
        (deg / 180 * .pi)
    }
    
    private func updateTurn() {
        let arcLengthTraveled = degToRad(speed) * stationaryCircleRadius
        let deltaTheta = arcLengthTraveled / movingCircleRadius
        turn += deltaTheta
    }
    
    override func draw(_ rect: CGRect) {
        UIColor.black.setStroke()
        let stationaryCircleFrame = CGRect(x: bounds.midX, y: bounds.midY, width: 0, height: 0)
            .insetBy(dx: -stationaryCircleRadius, dy: -stationaryCircleRadius)
        let stationaryCirclePath = UIBezierPath(ovalIn: stationaryCircleFrame)
        stationaryCirclePath.lineWidth = 2
        stationaryCirclePath.stroke()
        
        let movingCircleCenterX = sin(degToRad(position)) * (stationaryCircleRadius + movingCircleRadius) + bounds.midX
        let movingCircleCenterY = -cos(degToRad(position)) * (stationaryCircleRadius + movingCircleRadius) + bounds.midY
        let movingCircleFrame = CGRect(x: movingCircleCenterX, y: movingCircleCenterY, width: 0, height: 0)
            .insetBy(dx: -movingCircleRadius, dy: -movingCircleRadius)
        let movingCirclePath = UIBezierPath(ovalIn: movingCircleFrame)
        movingCirclePath.lineWidth = 2
        movingCirclePath.stroke()
        
        drawRotatedText("A", in: movingCircleFrame,
                        angle: degToRad(position) + turn, font: .systemFont(ofSize: 18), color: .black)
    }
}

// https://stackoverflow.com/a/42849406/5133585
func drawRotatedText(_ text: String, in rect: CGRect, angle: CGFloat, font: UIFont, color: UIColor) {
    let textSize = text.size(withAttributes: [.font: font])
    let p = CGPoint(x: rect.midX, y: rect.midY)
  let c = UIGraphicsGetCurrentContext()!
  c.saveGState()
  // Translate the origin to the drawing location and rotate the coordinate system.
  c.translateBy(x: p.x, y: p.y)
  c.rotate(by: angle)
  // Draw the text centered at the point.
    text.draw(at: CGPoint(x: -textSize.width / 2, y: -textSize.height / 2), withAttributes: [.font: font])
  // Restore the original coordinate system.
  c.restoreGState()
}
