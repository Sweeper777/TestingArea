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
    
    }
}
