import UIKit
import DCTextEngine
import RxSwift
import RxCocoa
import Vision
import CoreMedia

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    let disposeBag = DisposeBag()
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(textview.attributedText.attributes(at: 0, effectiveRange: nil))
        let model = try! VNCoreMLModel(for: MLModel(contentsOf: MobileNetV2Int8LUT.urlOfModelInThisBundle))
        let request = VNCoreMLRequest(model: model) {
            r, _ in
            print(r.results ?? "nil")
        }
        let image = CIImage(cgImage: UIImage(named: "settings")!.cgImage!)
        let handler = VNImageRequestHandler(ciImage: image, orientation: .up)
        try! handler.perform([request])
        
        let observable = Observable<[String: Int]>.of(["a": 1, "b": 2], ["c": 3, "d": 4]).flatMap { Observable.from(Array($0)) }.
        
        print("Hello!")
    }
    
    
    @IBAction func click() {
        textview.font = .systemFont(ofSize: textview.font!.pointSize)
    }
    
    @available(*, unavailable)
    @objc func foo() {}
}
