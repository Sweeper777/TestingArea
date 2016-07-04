import UIKit
import PasswordDialogViewController

class MyViewController: UIViewController {
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let dialog = PasswordDialogViewController(password: "hello")
        dialog.messageText = "Enter \"hello\""
        dialog.titleText = "Passcode"
        dialog.delegate = self
        dialog.show {
            print($0)
        }
    }
}
