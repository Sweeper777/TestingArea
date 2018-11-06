import UIKit

class BarChartView: UIView {
    var percentages: [(Double, Double, Double, Double)]! {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    let barWidth = 12.f
    
    override func draw(_ rect: CGRect) {
        guard let percentages = self.percentages else { return }
        
        let graphHeight = height * 8.0 / 9.0
        let separator = (width - barWidth * percentages.count.f) / (percentages.count.f + 1)
        for (index, bar) in percentages.enumerated() {
            let barX = (index + 1).f * separator + index.f * barWidth
            let barY = graphHeight * (1.0 - bar.0).f
            let barHeight = graphHeight - barY
            let subBars = [(0, bar.1), (1, bar.2), (2, bar.3)].sorted(by: { $0.1 > $1.1 })
            
        }
    }
extension UIColor {
    
    @nonobjc class var pinkishTan: UIColor {
        return UIColor(red: 233.0 / 255.0, green: 167.0 / 255.0, blue: 159.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var paleRed: UIColor {
        return UIColor(red: 214.0 / 255.0, green: 67.0 / 255.0, blue: 49.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var veryLightPink: UIColor {
        return UIColor(white: 238.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var darkPeach: UIColor {
        return UIColor(red: 221.0 / 255.0, green: 110.0 / 255.0, blue: 97.0 / 255.0, alpha: 1.0)
    }
    
}
}
