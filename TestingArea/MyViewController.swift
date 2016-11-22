import UIKit
import EZSwiftExtensions
import AVFoundation

class MyViewController: UIViewController {
    override func viewDidLoad() {
        let rect = "Hello".boundingRect(with: CGSize.zero, context: nil)
        let lbl = UILabel(frame: CGRect(x: 200, y: 200, w: rect.w, h: rect.h))
        lbl.backgroundColor = UIColor.black
        lbl.textColor = UIColor.white
        lbl.text = "Hello"
    }
}
