import UIKit
import MessageUI
import CoreData

class MyRenderer: UIPrintPageRenderer {
    override func drawPrintFormatter(_ printFormatter: UIPrintFormatter, forPageAt pageIndex: Int) {
        printFormatter.draw(in: self.printableRect, forPageAt: pageIndex)
    }
}

class MyViewController: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet var webView: UIWebView!
    @IBOutlet var webView2: UIWebView!
    
    override func viewDidLoad() {
        webView.loadRequest(URLRequest(url: URL(string: "https://en.wikipedia.org/wiki/Papists_Act_1778")!))
        webView2.loadRequest(URLRequest(url: URL(string: "https://en.wikipedia.org/wiki/Ekaterina_Bolshova")!))
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        let printController = UIPrintInteractionController.shared
        // 2
        let printInfo = UIPrintInfo(dictionary:nil)
        printInfo.outputType = UIPrintInfoOutputType.general
        printInfo.jobName = "print Job"
        printController.printInfo = printInfo
        
        let formatter = webView.viewPrintFormatter()
        let formatter1 = webView2.viewPrintFormatter()
        
        formatter.contentInsets = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
        formatter1.contentInsets = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
        
        let renderer = MyRenderer()
        renderer.addPrintFormatter(formatter, startingAtPageAt: 0)
        print(formatter.pageCount)
        renderer.addPrintFormatter(formatter1, startingAtPageAt: formatter.pageCount)
        
        printController.printPageRenderer = renderer
        
        // 4
        printController.present(animated: true, completionHandler: nil)
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
