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
        
        
        let squareSize = 400.f
        let strokeWidth = squareSize / 20
        
        func calculateFontSize() -> CGFloat {
            fontSizeThatFits(
                    size: CGSize(width: squareSize / 2,
                    height: squareSize / 2), text: "将",
                    font: UIFont.systemFont(ofSize: 1)
            )
        }
        
        func calculateOffset(withFont font: UIFont) -> CGPoint {
            let sizeWithFont = ("将" as NSString).size(withAttributes: [.font: font])
            return CGPoint(
                    x: (squareSize - sizeWithFont.width) / 2,
                    y: (squareSize - sizeWithFont.height) / 2
            )
        }
        
        func drawChessPiece(_ pieceName: String, position: CGPoint, backgroundColor: UIColor, font: UIFont, textOffset: CGPoint) {
            let centerOfPiece = CGPoint(x: position.x + squareSize / 2, y: position.y + squareSize / 2)
            let circlePath = UIBezierPath(
                    ovalIn: CGRect(origin: centerOfPiece, size: .zero)
                            .insetBy(dx: -squareSize * 0.4, dy: -squareSize * 0.4)
            )
            circlePath.lineWidth = strokeWidth * 1.2
            UIColor.black.setStroke()
            backgroundColor.setFill()
            circlePath.fill()
            circlePath.stroke()

            (pieceName as NSString).draw(at: CGPoint(
                x: position.x + textOffset.x,
                y: position.y + textOffset.y
            ), withAttributes: [.font: font, .foregroundColor: UIColor.white])
        }
        
        let fontSize = calculateFontSize()
        let font = UIFont.systemFont(ofSize: fontSize)
        let offset = calculateOffset(withFont: font)
        UIGraphicsBeginImageContext(CGSize(width: 500, height: 500))
        drawChessPiece("將", position: .zero, backgroundColor: .black, font: font, textOffset: offset)
        drawChessPiece("帥", position: CGPoint(x: 100, y: 100), backgroundColor: .red, font: font, textOffset: offset)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        let url = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("icon.png")
        try! image.pngData()?.write(to: url)
        print(url)
        
    }
    
    @IBAction private func click() {
        
    }
}
