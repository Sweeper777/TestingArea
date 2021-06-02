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

final class BlurEffectView: UIVisualEffectView {
    
    deinit {
    animator?.stopAnimation(true)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
   }

    private let theEffect: UIVisualEffect = UIBlurEffect(style: .regular)
    lazy var animator: UIViewPropertyAnimator? = {
        let anim = UIViewPropertyAnimator(duration: 1, curve: .linear) { [unowned self] in
            self.effect = self.theEffect
        }
        anim.pausesOnCompletion = true
        self.effect = nil
        return anim
    }()

}

