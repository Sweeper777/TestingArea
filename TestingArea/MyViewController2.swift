import UIKit
import AVFoundation
import EZSwiftExtensions
import SwiftChart
import MLScreenshot

class MyViewController2: UIViewController, ChartDelegate {
    @IBOutlet var chart: Chart!
    @IBOutlet var label: UILabel!
    @IBOutlet var labelLeadingMarginConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        let labels = ["A", "B", "C", "D", "E", "F", "G", "H", ""]
        let chartSeries = ChartSeries([10, 5, 7, 10, 3, 6, 4, 7])
        chartSeries.area = true
        chart.add(chartSeries)
        chart.xLabelsFormatter = { index, value in return labels[index] }
        test()
    }
    
    func test() {
        chart.xLabels = Array(0...8).map { Float($0) }
        let series = chart.series.first!
        let max = ceil(series.data.map { $0.y }.max()!)
        chart.yLabels = Array(stride(from: 0, through: max, by: 1))
        chart.delegate = self
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        let image = chart.screenshot()
        let imgView = UIImageView(frame: self.view.frame)
        imgView.contentMode = .scaleAspectFit
        imgView.image = image
        self.view.addSubview(imgView)
    }
    
    func didTouchChart(_ chart: Chart, indexes: Array<Int?>, x: Float, left: CGFloat) {
        
        if let value = chart.valueForSeries(0, atIndex: indexes[0]) {
            label.isHidden = false
            let labelLeadingMarginInitialConstant = CGFloat(0)
            let numberFormatter = NumberFormatter()
            numberFormatter.minimumFractionDigits = 2
            numberFormatter.maximumFractionDigits = 2
            label.text = numberFormatter.string(from: NSNumber(value: value))
            
            // Align the label to the touch left position, centered
            var constant = labelLeadingMarginInitialConstant + left - (label.frame.width / 2)
            
            // Avoid placing the label on the left of the chart
            if constant < labelLeadingMarginInitialConstant {
                constant = labelLeadingMarginInitialConstant
            }
            
            // Avoid placing the label on the right of the chart
            let rightMargin = chart.frame.width - label.frame.width
            if constant > rightMargin {
                constant = rightMargin
            }
            
            labelLeadingMarginConstraint.constant = constant
            
        }
        
    }
    
    func didFinishTouchingChart(_ chart: Chart) {
        
    }
}
