import UIKit
import SwiftyUtils
import EZSwiftExtensions
import ASToast
import SCLAlertView
import SwiftyJSON

class MyViewController2: UIViewController {
    @IBOutlet var textView: UITextView!
    
    @IBAction func btnClicked(sender: UIButton) {
        let alert = SCLAlertView(appearance: SCLAlertView.SCLAppearance(showCloseButton: false, showCircularIcon: false))
        let txtLink = alert.addTextField("Enter Link")
        let txtDisplay = alert.addTextField("Enter Display Text")
        alert.addButton("OK", action: {
            print(txtLink.text)
            print(txtDisplay.text)
        })
        alert.showSuccess("Add Hyperlink", subTitle: "")
    }
    
    func home() {
        print("Home tapped")
    }
    
    func settings() {
        print("Settings tapped")
    }
    
    @IBAction func changed() {
        print("changed")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
