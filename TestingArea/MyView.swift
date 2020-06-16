import UIKit
import SwiftyUtils

class AnalogClockView: UIView {
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
