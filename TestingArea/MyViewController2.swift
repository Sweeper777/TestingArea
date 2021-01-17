import UIKit
import RxSwift
import RxCocoa
import SwiftyUtils

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var image: UIImageView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UIFont.systemFont(ofSize: 11).fontName)
    }
    
    func test1() {
        let icon = NSTextAttachment()
        icon.image = UIImage(systemName: "questionmark.circle.fill")!
        let attrString = NSMutableAttributedString(attachment: icon)
        attrString.append(NSAttributedString(string: " Hello!"))
        UIGraphicsBeginImageContext(CGSize(width: 100, height: 100))
        attrString.draw(in: CGRect(x: 0, y: 0, width: 100, height: 100))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.image.image = image
    }
    
    func test2() {
        let attrString = NSMutableAttributedString(string: "􀈂", attributes: [.font: UIFont.systemFont(ofSize: 11)])
        attrString.append(NSAttributedString(string: " Hello!"))
        UIGraphicsBeginImageContext(CGSize(width: 100, height: 100))
        attrString.draw(in: CGRect(x: 0, y: 0, width: 100, height: 100))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.image.image = image
    }
    
    func test3() {
        let icon = NSTextAttachment()
        icon.image = UIImage(named: "settings")!
        let attrString = NSMutableAttributedString(attachment: icon)
        attrString.append(NSAttributedString(string: " Hello!"))
        UIGraphicsBeginImageContext(CGSize(width: 100, height: 100))
        
        let currentContext = UIGraphicsGetCurrentContext()
        
        currentContext?.textMatrix = .identity
        
        let frameRect = CGRect(x: 0, y: 0, width: 100, height: 100)
        let framePath = CGMutablePath()
        framePath.addRect(frameRect, transform: .identity)
        
        let framesetter = CTFramesetterCreateWithAttributedString(attrString)
        let frameRef = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), framePath, nil)
        
        currentContext?.translateBy(x: 0, y: 100)
        currentContext?.scaleBy(x: 1.0, y: -1.0)
        
        CTFrameDraw(frameRef, currentContext!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.image.image = image
    }
    
        
    @IBAction private func click() {
    }
}
