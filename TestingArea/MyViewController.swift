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
        }
    }
}
