import UIKit
import SwiftyUtils
import SnapKit
import SwiftyJSON

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testSameFrame()
    }
    
    func testRotation() {
        let label1 = UIView(frame: CGRect(x: 10, y: 100, width: 100, height: 50))
        let label2 = UIView(frame: CGRect(x: 10, y: 100, width: 100, height: 50))
        view.addSubview(label1)
        view.addSubview(label2)
        label1.backgroundColor = .red
        label2.backgroundColor = .blue
        label2.transform = CGAffineTransform(rotationAngle: .pi / 2)
    }
    
    func rotateRect(_ rect: CGRect) -> CGRect {
        let x = rect.x
        let y = rect.y
        let transform = CGAffineTransform(translationX: -x, y: -y)
            .rotated(by: .pi / 2)
            .translatedBy(x: x, y: y)
        return rect.applying(transform)
    }
    
    func testSameFrame() {
        let desiredFrame = CGRect(x: 10, y: 100, width: 50, height: 100)
        let label1 = UIView(frame: desiredFrame)
        let center = CGPoint(x: desiredFrame.midX, y: desiredFrame.midY)
        let label2Frame = CGRect(x: 0, y: 0, width: desiredFrame.height, height: desiredFrame.width)
        let label2 = UIView(frame: label2Frame)
        view.addSubview(label1)
        view.addSubview(label2)
        label1.backgroundColor = .red
        label2.backgroundColor = .blue
        label2.center = center
        label2.transform = CGAffineTransform(rotationAngle: -.pi / 2)
    }
    
    @IBAction func click() {
    }
    
    override func overrideTraitCollection(forChild childViewController: UIViewController) -> UITraitCollection? {
        if view.bounds.width < view.bounds.height {
            return UITraitCollection(horizontalSizeClass: .compact)
        } else {
            return UITraitCollection(horizontalSizeClass: .regular)
        }
    }
}
