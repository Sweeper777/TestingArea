import UIKit
import RxSwift
import RxCocoa
import SwiftyUtils
import SwiftUI
import Alamofire

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    let disposeBag = DisposeBag()
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loader = UINib(nibName: "MyCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
        loader.frame = CGRect(x: 50, y: 100, width: 300, height: 100)
        view.addSubview(loader)
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
    }
    
    var ob: NSKeyValueObservation?
    
    @IBAction private func click() {
        let vc = storyboard?.instantiateViewController(identifier: "second") as! MyViewController
        vc.modalPresentationStyle = .overFullScreen

        present(vc, animated: false) { //vc presentation completion handler
            
            //adding a completion handler to the UIViewPropertyAnimator
            self.ob?.invalidate()
            self.ob = vc.blurView.animator?.observe(\.isRunning, options: [.new], changeHandler: { (animator, change) in
                if !(change.newValue!) {
                    print("completed")
                }
            })
            vc.blurView.animator?.startAnimation()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("")
    }
}

class Foo  {
    func processCompleted() {
        
    }
    
}

extension Foo : PrintProtocolDelegate{
    @objc func didClose(withTrailingMetadata trailingMetadata: [AnyHashable : Any]?, error: Error?) {
        
    }
}
