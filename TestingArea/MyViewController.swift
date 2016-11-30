import UIKit
import EZSwiftExtensions
import MessageUI
import BNHtmlPdfKit

class MyViewController: UIViewController, MFMailComposeViewControllerDelegate, BNHtmlPdfKitDelegate {
    var pdfGenerator: BNHtmlPdfKit!
    
    override func viewDidLoad() {
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
    }
    
    func htmlPdfKit(_ htmlPdfKit: BNHtmlPdfKit!, didSavePdfData data: Data!) {
        if( MFMailComposeViewController.canSendMail() ) {
            print("Can send email.")
            
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
            mailComposer.modalPresentationStyle = .formSheet
            
            mailComposer.addAttachmentData(data, mimeType: "application/pdf", fileName: "lorem")
            self.presentVC(mailComposer)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismissVC(completion: nil)
    }
    }
}
