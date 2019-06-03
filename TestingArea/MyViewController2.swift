import UIKit
import SwiftyUtils
import Contacts
import ContactsUI

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    @IBOutlet var imageView: UIImageView!

    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func click() {
       test1()
    }
    
    func test1() {
        let contact = CNMutableContact()
        contact.familyName = "Cheng"
        contact.givenName = "Xiu"
        contact.emailAddresses = [CNLabeledValue(label: "work", value: "xiu.cheng2001@gmail.com" as NSString)]
        let store = CNContactStore()
        
        let controller = CNContactViewController(forNewContact: contact)
        controller.contactStore = store
        controller.delegate = self
        self.present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
    }
    
    func test2() {
        let contact = CNMutableContact()
        contact.familyName = "Foo"
        contact.givenName = "Bar"
        contact.emailAddresses = [CNLabeledValue(label: "work", value: "user@example.com" as NSString)]
        let saveRequest = CNSaveRequest()
        saveRequest.add(contact, toContainerWithIdentifier: nil)
        do {
            try CNContactStore().execute(saveRequest)
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

extension MyViewController2 : CNContactViewControllerDelegate {
    func contactViewController(_ viewController: CNContactViewController, didCompleteWith contact: CNContact?) {
        viewController.dismiss(animated: true, completion: nil)
        
        print(contact)
    }
}
