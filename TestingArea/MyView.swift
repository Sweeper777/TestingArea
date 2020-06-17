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
    
    }
}
