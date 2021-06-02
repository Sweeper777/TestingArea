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
    @IBOutlet var label: UILabel!
    @IBOutlet var c1: NSLayoutConstraint!
    @IBOutlet var c2: NSLayoutConstraint!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    let disposeBag = DisposeBag()
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fooA = FooStruct(bar_value: 23)
        let fooB = FooStruct(bar_value: 19)
        let swiftFooArray = [fooA, fooB]
        swiftFooArray.withUnsafeBufferPointer { (bufferPointer) in
            let f = FooArray(foos: UnsafeMutablePointer(mutating: bufferPointer.baseAddress), foo_count: 2)
            print_foo_array(f)
        }
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        NSLayoutConstraint.deactivate([c1, c2])
        label.translatesAutoresizingMaskIntoConstraints = true
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
            self.label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        }
    }
    
    @IBAction private func click() {
    label.translatesAutoresizingMaskIntoConstraints = false
    UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
        NSLayoutConstraint.activate([self.c1, self.c2])
        self.view.layoutIfNeeded()
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

