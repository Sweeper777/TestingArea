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
    }
    
    @IBAction private func click() {
        let imageView = image!
        imageView.image = UIImage(named: "soLogo")
        let renderer = ImagePrintPageRenderer(image: imageView.image!)
//        let formatter = imageView.viewPrintFormatter()
//        renderer.addPrintFormatter(formatter, startingAtPageAt: 0)
        let printJob = UIPrintInfo(dictionary: [:])
        printJob.orientation = .landscape
        let shareSheet = UIActivityViewController(activityItems: [imageView.image!, renderer, printJob], applicationActivities: [])
        self.present(shareSheet, animated: true, completion: nil)
    }
}

class ImagePrintPageRenderer: UIPrintPageRenderer {
    let image: UIImage

    init(image: UIImage) {
        self.image = image
    }

    override func drawPage(at pageIndex: Int, in printableRect: CGRect) {
        let xScale = printableRect.width / image.size.width
        let yScale = printableRect.height / image.size.height
        let scale = min(xScale, yScale)
        image.draw(in: CGRect(origin: printableRect.origin, size: CGSize(width: image.size.width * scale, height: image.size.height * scale)))
    }

//    override func drawPrintFormatter(_ printFormatter: UIPrintFormatter, forPageAt pageIndex: Int) {
//
//    }
}
