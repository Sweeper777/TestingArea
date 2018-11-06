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
            
            // draw gray bar
            let grayBarPath = UIBezierPath(roundedRect: CGRect(x: barX, y: barY, width: barWidth, height: barHeight), cornerRadius: barWidth / 2)
            UIColor.veryLightPink.setFill()
            grayBarPath.fill()
            
            // draw sub bars
            let colorDict: [Int: UIColor] = [
                0: .pinkishTan,
                1: .darkPeach,
                2: .paleRed
            ]
            
            for subBar in subBars {
                let subBarPath = UIBezierPath(roundedRect: CGRect(x: barX, y: graphHeight - barHeight * subBar.1.f, width: barWidth, height: barHeight * subBar.1.f), cornerRadius: barWidth / 2)
                colorDict[subBar.0]!.setFill()
                subBarPath.fill()
            }
            
        }
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

fileprivate func getLast7Weekdays(date: Date) -> [String] {
    let dates = (0..<7).map { date.addingTimeInterval(Double(60 * 60 * 24 * -$0)) }
    let formatter = DateFormatter()
    formatter.dateFormat = "E"
    return dates.map { formatter.string(from: $0) }.reversed()
}
