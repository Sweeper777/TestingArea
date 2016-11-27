import UIKit
import EZSwiftExtensions
import MessageUI
import PDFGenerator

class MyViewController: UIViewController, MFMailComposeViewControllerDelegate {
    override func viewDidLoad() {
        
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
//        // 1
//        let printController = UIPrintInteractionController.shared
//        // 2
//        let printInfo = UIPrintInfo(dictionary:nil)
//        printInfo.outputType = UIPrintInfoOutputType.general
//        printInfo.jobName = "print Job"
//        printController.printInfo = printInfo
//        
//        // 3
//        var text = ""
//        for _ in 0..<2000 {
//            text += "X"
//        }
//        
//        let formatter = self.view.viewWithTag(1)!.viewPrintFormatter()
//        
//        formatter.contentInsets = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
//        printController.printFormatter = formatter
//        
//        // 4
//        printController.present(animated: true, completionHandler: nil)
        
        //Check to see the device can send email.
        if( MFMailComposeViewController.canSendMail() ) {
            print("Can send email.")
            
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
        mailComposer.modalPresentationStyle = .formSheet
            
            if let pdf = try? PDFGenerator.generated(by: [self.view.viewWithTag(1)!]) {
                mailComposer.addAttachmentData(pdf, mimeType: "application/pdf", fileName: "lorem")
                self.presentVC(mailComposer)
            }
    var touchIndicators: [UIView] = []
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: view)
            let touchIndicator = UIView(frame: CGRect(x: location.x - 10, y: location.y - 10, width: 20, height: 20))
            touchIndicator.alpha = 0.5
            touchIndicator.backgroundColor = UIColor.red
            touchIndicator.layer.cornerRadius = 10
            self.view.addSubview(touchIndicator)
            touchIndicators.append(touchIndicator)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for indicator in touchIndicators {
            indicator.removeFromSuperview()
        }
        touchIndicators = []
    }
}
