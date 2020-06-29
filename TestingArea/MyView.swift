import UIKit

class TimelineItemCell: UITableViewCell {
    let lineLeftMargin: CGFloat = 120
    
    var style: TimelineItemCellStyle = .sole {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let line = UIBezierPath()
        if [TimelineItemCellStyle.end, .middle].contains(style) {
            line.move(to: CGPoint(x: lineLeftMargin, y: 0))
        } else {
            line.move(to: CGPoint(x: lineLeftMargin, y: bounds.midY))
        }
        if [TimelineItemCellStyle.start, .middle].contains(style) {
            line.addLine(to: CGPoint(x: lineLeftMargin, y: bounds.maxY))
        } else {
            line.addLine(to: CGPoint(x: lineLeftMargin, y: bounds.midY))
        }
        line.lineWidth = 2
        UIColor.black.setStroke()
        line.stroke()
        
        let circle = UIBezierPath(ovalIn:
            CGRect(x: lineLeftMargin, y: bounds.midY, width: 0, height: 0)
                .insetBy(dx: -12, dy: -12))
        circle.lineWidth = 2
        UIColor.white.setFill()
        circle.stroke()
        circle.fill()
    }
}

enum TimelineItemCellStyle {
    case start
    case end
    case middle
    case sole
}
