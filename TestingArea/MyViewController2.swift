import UIKit
import AVFoundation
import EZSwiftExtensions
import SwiftChart
import MLScreenshot

class MyViewController2: UIViewController {
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
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        let image = chart.screenshot()
        let imgView = UIImageView(frame: self.view.frame)
        imgView.contentMode = .scaleAspectFit
        imgView.image = image
        self.view.addSubview(imgView)
    }
}
