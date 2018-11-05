import UIKit

class BarChartView: UIView {
    var percentages: [(Double, Double, Double, Double)]! {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    let barWidth = 12.f
    
}
