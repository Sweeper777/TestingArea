import UIKit
import SwiftyUtils
import RxSwift
import RealmSwift
import SwiftyAnimate
import NGORoundedButton
import JTImageButton

class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var square: UIView!
    
    let disposeBag = DisposeBag()
    let fontStyles: [UIFontTextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func click() {
        UIView.animate(withDuration: 1) { 
//            self.square.backgroundColor = .black
        }
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
}

@IBDesignable
class SquareView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let strokeWidth = self.width / 8
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.width - strokeWidth / 2, y: 0))
        path.addLine(to: CGPoint(x: self.width - strokeWidth / 2, y: self.height - strokeWidth / 2))
        path.addLine(to: CGPoint(x: 0, y: self.height - strokeWidth / 2))
        self.backgroundColor?.darker().setStroke()
        path.lineWidth = strokeWidth
        path.stroke()
    }
}
