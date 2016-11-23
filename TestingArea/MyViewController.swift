import UIKit
import EZSwiftExtensions
import AVFoundation

class MyViewController: UIViewController {
    override func viewDidLoad() {
        
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        // 1
        let printController = UIPrintInteractionController.shared
        // 2
        let printInfo = UIPrintInfo(dictionary:nil)
        printInfo.outputType = UIPrintInfoOutputType.general
        printInfo.jobName = "print Job"
        printController.printInfo = printInfo
        
        // 3
        var text = ""
        for _ in 0..<2000 {
            text += "X"
        }
        
        let formatter = self.view.viewWithTag(1)!.viewPrintFormatter()
        
        formatter.contentInsets = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
        printController.printFormatter = formatter
        
        // 4
        printController.present(animated: true, completionHandler: nil)
    }
}
