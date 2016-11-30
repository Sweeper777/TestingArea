import UIKit
import EZSwiftExtensions
import MessageUI
import BNHtmlPdfKit
import CoreData

class MyViewController: UIViewController, MFMailComposeViewControllerDelegate, BNHtmlPdfKitDelegate {
    var pdfGenerator: BNHtmlPdfKit!
    
    override func viewDidLoad() {
        
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
