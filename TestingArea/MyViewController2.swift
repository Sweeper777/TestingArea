import UIKit
import SwiftyUtils
import RxSwift
import SceneKit
import SwiftyJSON
import Charts

class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var barChart: BarChartView!
    
    let disposeBag = DisposeBag()
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataSet1 = BarChartDataSet(values: [
            BarChartDataEntry(x: 1, y: 1),
            BarChartDataEntry(x: 3, y: 4),
            BarChartDataEntry(x: 5, y: 9),
            BarChartDataEntry(x: 7, y: 16),
            BarChartDataEntry(x: 9, y: 25),
            BarChartDataEntry(x: 11, y: 36),
            BarChartDataEntry(x: 13, y: 49),
            ], label: "Squares")
        dataSet1.colors = [UIColor.green.darker()]
        let dataSet2 = BarChartDataSet(values: [
            BarChartDataEntry(x: 2, y: 1),
            BarChartDataEntry(x: 4, y: 8),
            BarChartDataEntry(x: 6, y: 27),
            BarChartDataEntry(x: 8, y: 64),
            BarChartDataEntry(x: 10, y: 125),
            BarChartDataEntry(x: 12, y: 196),
            BarChartDataEntry(x: 14, y: 343),
            ], label: "Cubes")
        
        dataSet2.colors = [UIColor.blue.darker()]
        
        barChart.data = BarChartData(dataSets: [dataSet1, dataSet2])
        barChart.setScaleEnabled(false)
        barChart.dragEnabled = false
        barChart.drawValueAboveBarEnabled = false
        
        barChart.xAxis.valueFormatter = MyValueFormatter()
    }
    
    @IBAction func click() {
        (barChart.barData?.dataSets.first as? BarChartDataSet)?.colors = [UIColor.red]
    }
}

class MyValueFormatter : IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        if Int(value) % 2 == 1 {
            return ["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh"][Int(value) / 2]
        } else {
            return ""
        }
    }
}
