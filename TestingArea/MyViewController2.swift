import UIKit
import SwiftyUtils
import EZSwiftExtensions
import ASToast
import NBEmojiSearchView

class MyViewController2: UIViewController, NBEmojiSearchViewDelegate {
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    
    var searchView1: NBEmojiSearchView!
    var searchView2: NBEmojiSearchView!
    
    override func viewDidLoad() {
        searchView1 = NBEmojiSearchView()
        searchView1.delegate = self
        searchView1.install(on: view1 as! UITextView)
        searchView2 = NBEmojiSearchView()
        searchView2.delegate = self
        searchView2.install(on: view2 as! UITextView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if self.slideMenuController()!.isRightOpen() {
//            self.slideMenuController()!.closeRight()
//        } else {
//            self.slideMenuController()!.openRight()
//        }
        view1.makeToast("Message1", duration: 1, position: ASToastPosition.ASToastPositionBotom as AnyObject?, backgroundColor: nil, titleColor: nil, messageColor: nil)
        view2.makeToast("Message2", duration: 2, position: ASToastPosition.ASToastPositionCenter as AnyObject?, backgroundColor: nil, titleColor: nil, messageColor: nil)
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("Hello")
    }
}
