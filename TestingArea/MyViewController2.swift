import UIKit
import AVFoundation
import EZSwiftExtensions
import SwiftChart

class MyViewController2: UIViewController {
    @IBOutlet var chart: Chart!
    
    override func viewDidLoad() {
        let labels = ["A", "B", "C", "D", "E", "F", "G", "H", ""]
        let chartSeries = ChartSeries([10, 5, 7, 60, 3, 6, 4, 7])
        chartSeries.area = true
        chart.add(chartSeries)
        chart.xLabelsFormatter = { index, value in return labels[index] }
    }
}
