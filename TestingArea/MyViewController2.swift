import UIKit
import SwiftyUtils
import SwiftyJSON
import Vision
import SwiftOCR

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    @IBOutlet var image4: UIImageView!
    
    let image = UIImage(named: "example")!
    
    var results: [VNTextObservation] = [] {
        didSet {
            if results.count == 4 {
                image1.image = processTextObservation(results[0], originalImage: image)
                image2.image = processTextObservation(results[1], originalImage: image)
                image3.image = processTextObservation(results[2], originalImage: image)
                image4.image = processTextObservation(results[3], originalImage: image)
            }
        }
    }
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        let vnImage = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
        let textRectsRequest = VNDetectTextRectanglesRequest { (request, error) in
            if let results = request.results as? [VNTextObservation] {
                self.results = results
                print("\(results.count) Results found")
            }
        }
        
        try? vnImage.perform([textRectsRequest])
    }
    
    @IBAction func click() {
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func processTextObservation(_ observation: VNTextObservation, originalImage: UIImage) -> UIImage? {
        let transform = CGAffineTransform(scaleX: 1, y: -1).translatedBy(x: 0, y: -originalImage.size.height)
        
        let translate = CGAffineTransform.identity.scaledBy(x: originalImage.size.width, y: originalImage.size.height)
        guard let croppedImage = originalImage.cropped(rect: observation.boundingBox.applying(translate).applying(transform)) else {
            print("Image crop failed")
            return nil
        }
        return croppedImage
    }
}

extension UIImage {
    func cropped(rect: CGRect) -> UIImage? {
        let transform: CGAffineTransform
        switch self.imageOrientation {
        case .left:
            transform = CGAffineTransform(translationX: 0, y: -self.size.height).rotated(by: .pi / 2)
        case .right:
            transform = CGAffineTransform(translationX: -self.size.width, y: 0).rotated(by: -.pi / 2)
        case .down:
            transform = CGAffineTransform(translationX: -self.size.width, y: -self.size.height).rotated(by: -.pi)
        default:
            transform = .identity
        }
        guard let imageRef = self.cgImage?.cropping(to: rect.applying(transform.scaledBy(x: self.scale, y: self.scale))) else { return nil }
        let image = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
        return image
    }
}
