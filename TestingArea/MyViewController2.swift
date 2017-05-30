import UIKit
import SwiftyUtils
import FirebaseAuth
import GoogleSignIn
import MultiSlider
import UIViewController_NavigationBar

class MyViewController2: UIViewController, GIDSignInUIDelegate {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var multiSlider: MultiSlider!
    
    override func viewDidLoad() {
        test1()
        customNav()
    }
    
    func test1() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func test2() {
        let myNav = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.width, height: 44))
        myNav.barTintColor = #colorLiteral(red: 0.3529411765, green: 0.7333333333, blue: 0.3529411765, alpha: 1)
        myNav.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.view.addSubview(myNav)
        let cancelItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
        cancelItem.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let doneItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
        doneItem.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let navigItem: UINavigationItem = UINavigationItem(title: NSLocalizedString("Question Editor", comment: ""))
        navigItem.rightBarButtonItem = doneItem
        navigItem.leftBarButtonItem = cancelItem
        myNav.items = [navigItem]
        let top = NSLayoutConstraint(item: myNav, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        let leading = NSLayoutConstraint(item: myNav, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let trailing = NSLayoutConstraint(item: myNav, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        view.addConstraints([top, leading, trailing])
    }
    
    func customNav() {
        self.navigationBar.barTintColor = .green
        self.navigationItem.title = "Hello"
    }
    
    override func hasCustomNavigationBar() -> Bool {
        return true
    }
    
    @IBAction func click() {
        
    }
    
    
}
