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
    
    var gr: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test4()
        print(UIFont.systemFont(ofSize: 11).fontName)
        
        gr = UITapGestureRecognizer(target: self, action: #selector(grAction))
        gr.numberOfTapsRequired = 1
        gr.numberOfTouchesRequired = 1
        image.addGestureRecognizer(gr)
        image.isUserInteractionEnabled = true
    }
    var page1: UIImage!
    var page2: UIImage!
    
    func test4() {
        let icon = NSTextAttachment()
        icon.image = UIImage(systemName: "questionmark.circle.fill")!
        let attrString = NSTextStorage(string: "Hello World! ")
        attrString.append(NSAttributedString(attachment: icon))
        attrString.append(NSAttributedString(string: " Hello! Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vulputate diam lacus. Pellentesque ultricies felis in fringilla vulputate. Nunc et venenatis magna. Donec congue, urna vel viverra mollis, odio ipsum efficitur massa, a malesuada erat elit non justo. Curabitur volutpat nibh nisl, eu scelerisque magna pretium eget. Nulla ultricies id."))
        let layoutManager = NSLayoutManager()
        attrString.addLayoutManager(layoutManager)
        let rect1 = CGRect(x: 0, y: 0, width: 100, height: 100)
        let rect2 = CGRect(x: 0, y: 110, width: 100, height: 100)
        let container1 = NSTextContainer(size: rect1.size)
        container1.lineBreakMode = .byTruncatingTail
        let container2 = NSTextContainer(size: rect2.size)
        container2.lineBreakMode = .byTruncatingTail
        let textView1 = UITextView(frame: rect1, textContainer: container1)
        let textView2 = UITextView(frame: rect2, textContainer: container2)
        layoutManager.addTextContainer(textView1.textContainer)
        layoutManager.addTextContainer(textView2.textContainer)
        
        print(layoutManager.isContainerTruncated(container: container1))
        print(layoutManager.isContainerTruncated(container: container2))
        
        self.page1 = textView1.asImage()
        
        self.page2 = textView2.asImage()
        
        self.image.image = page1
    }
    
    @IBAction private func click() {
        self.image.image = page2
    }
    
    @objc func grAction(_ sender: UITapGestureRecognizer) {
        print(sender.state.rawValue)
    }
}

extension UIView {

    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

extension NSLayoutManager {
    func isContainerTruncated(container: NSTextContainer) -> Bool {
        let glyphRangeOfContainer = glyphRange(for: container)
        var isTruncating = false
        enumerateLineFragments(forGlyphRange: glyphRangeOfContainer) { _, _, _, glyphRange, stop in
            let truncatedRange = self.truncatedGlyphRange(inLineFragmentForGlyphAt: glyphRange.lowerBound)
            if truncatedRange.location != NSNotFound {
              isTruncating = true
              print("Truncated!")
              stop.pointee = true
            }
        }
        return isTruncating
    }
}
