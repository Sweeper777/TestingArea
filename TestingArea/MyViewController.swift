import UIKit
import EZSwiftExtensions
import MessageUI
import CoreData
import Charts

class MyViewController: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet var barChart: BarChartView!
    override func viewDidLoad() {
        let entry1 = BarChartDataSet(values: [BarChartDataEntry(x: 0, y: 10)], label: nil)
        let entry2 = BarChartDataSet(values: [BarChartDataEntry(x: 1, y: 5)], label: nil)
        let entry3 = BarChartDataSet(values: [BarChartDataEntry(x: 2, y: 7)], label: nil)
        let entry4 = BarChartDataSet(values: [BarChartDataEntry(x: 3, y: 3)], label: nil)
        let data = BarChartData()
        data.addDataSet(entry1)
        data.addDataSet(entry2)
        data.addDataSet(entry3)
        data.addDataSet(entry4)
        barChart.data = data
        let axis = barChart.xAxis
        axis.labelCount = 4
        axis.drawLabelsEnabled = true
        axis.labelPosition = .bottom
        axis.valueFormatter = DefaultAxisValueFormatter()
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        let context = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        for i in 0..<100 {
            let managedObj = Test(entity: NSEntityDescription.entity(forEntityName: "Test", in: context)!, insertInto: context)
            managedObj.property1 = Int32(i)
            managedObj.property2 = i.description
            managedObj.property3 = Date(timeIntervalSinceNow: TimeInterval(i)) as NSDate
            managedObj.property4 = i % 2 == 0
        }
        try? context.save()
    }    
}


extension Date {
    func isTheSameDayAs(other: Date) -> Bool {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: other)
        components.hour = 00
        components.minute = 00
        components.second = 00
        let startDate = calendar.date(from: components)!
        components.hour = 23
        components.minute = 59
        components.second = 59
        let endDate = calendar.date(from: components)!
        
        return (startDate.compare(self) == .orderedAscending || startDate.compare(self) == .orderedSame) && (endDate.compare(self) == .orderedDescending || endDate.compare(self) == .orderedSame)
    }
}
