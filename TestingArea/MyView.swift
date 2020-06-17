import UIKit
import SwiftyUtils

class AnalogClockView: UIView {
    
    var labels = [UILabel]()
    
    
    var clockFrame: CGRect {
        if width > height {
            return CGRect(x: (width - height) / 2, y: 0, width: height, height: height)
        } else {
            return CGRect(x: 0, y: (height - width) / 2, width: width, height: width)
        }
    }
    
    var clockSize: CGFloat {
        min(width, height)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        labels.append(contentsOf: (1...12).map {
            let label = UILabel()
            label.text = "\($0)"
            return label
        })
        labels.forEach(self.addSubview(_:))
    }
    
    
    let digitsInset = 0.3.f
    let fontScale = 0.1.f
    let borderWidthScale = 0.014.f
    let thinMarkingInset = 0.1.f
    let thickMarkingInset = 0.16.f
    let thinMarkingWidthScale = 0.01.f
    let thickMarkingWidthScale = 0.014.f
    let secondHandLongRadius = 0.9.f
    let secondHandShortRadius = 0.1.f
    let secondHandWidthScale = 0.01.f
    let minuteHandLongRadius = 0.85.f
    let minuteHandShortRadius = 0.095.f
    let minuteHandWidthScale = 0.02.f
    let hourHandLongRadius = 0.5.f
    let hourHandShortRadius = 0.05.f
    let hourHandWidthScale = 0.03.f
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let center = CGPoint(x: clockFrame.midX, y: clockFrame.midY)
        let radius = clockSize * (1 - digitsInset) / 2
        for (label, angle) in zip(labels, stride(from: CGFloat.pi / -3, to: 5 * .pi / 3, by: .pi / 6)) {
            label.font = UIFont.monospacedDigitSystemFont(ofSize: clockSize * fontScale, weight: .regular)
            label.sizeToFit()
            label.center = center.applying(CGAffineTransform(translationX: radius * cos(angle), y: radius * sin(angle)))
        }
    }
    
    
    func drawMarking(angle: CGFloat, radius: CGFloat, lineWidth: CGFloat) {
        let clockFrameRadius = clockFrame.width / 2
        let center = CGPoint(x: clockFrame.midX, y: clockFrame.midY)
        let marking = UIBezierPath()
        marking.move(to: center.applying(
            CGAffineTransform(translationX: radius * cos(angle), y: radius * sin(angle))
        ))
        marking.addLine(to: center.applying(
            CGAffineTransform(translationX: clockFrameRadius * cos(angle), y: clockFrameRadius * sin(angle))
        ))
        marking.lineWidth = lineWidth
        marking.lineCapStyle = .round
        marking.stroke()
    }
    
    func drawHand(angle: CGFloat, longRadius: CGFloat, shortRadius: CGFloat, lineWidth: CGFloat, color: UIColor) {
        let center = CGPoint(x: clockFrame.midX, y: clockFrame.midY)
        let hand = UIBezierPath()
        hand.move(to: center.applying(
            CGAffineTransform(translationX: -shortRadius * cos(angle), y: -shortRadius * sin(angle))
        ))
        hand.addLine(to: center.applying(
            CGAffineTransform(translationX: longRadius * cos(angle), y: longRadius * sin(angle))
        ))
        hand.lineWidth = lineWidth
        hand.lineCapStyle = .round
        color.setStroke()
        hand.stroke()
    }
}
