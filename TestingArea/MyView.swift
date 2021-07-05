import UIKit
import SwiftyUtils

class TwoCirclesView: UIView {
    var stationaryCircleRadius: CGFloat = 120
    var movingCircleRadius: CGFloat = 40
    var roll = true
    var position: CGFloat = 0
    var turn: CGFloat = 0
    var speed: CGFloat = 1
    
    }
    
    private func degToRad(_ deg: CGFloat) -> CGFloat {
        (deg / 180 * .pi)
    }
    
    private func updateTurn() {
        let arcLengthTraveled = degToRad(speed) * stationaryCircleRadius
        let deltaTheta = arcLengthTraveled / movingCircleRadius
        turn += deltaTheta
    }
    
    }
}

// https://stackoverflow.com/a/42849406/5133585
func drawRotatedText(_ text: String, in rect: CGRect, angle: CGFloat, font: UIFont, color: UIColor) {
    let textSize = text.size(withAttributes: [.font: font])
    let p = CGPoint(x: rect.x + (rect.width - textSize.width) / 2, y: rect.y + (rect.height - textSize.height) / 2)
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
