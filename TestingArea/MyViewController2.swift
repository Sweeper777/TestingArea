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
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    let disposeBag = DisposeBag()
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loader = LoaderView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        view.addSubview(loader)
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
    }
    
    var ob: NSKeyValueObservation?
    
    @IBAction private func click() {
        let vc = storyboard?.instantiateViewController(identifier: "second") as! MyViewController
        vc.modalPresentationStyle = .overFullScreen

        present(vc, animated: false) { //vc presentation completion handler
            
            //adding a completion handler to the UIViewPropertyAnimator
            self.ob?.invalidate()
            self.ob = vc.blurView.animator?.observe(\.isRunning, options: [.new], changeHandler: { (animator, change) in
                if !(change.newValue!) {
                    print("completed")
                }
            })
            vc.blurView.animator?.startAnimation()
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

class LoaderView: UIView {

    private let lineWidth : CGFloat = 5
    var backgroundMask = CAShapeLayer()
    var grayLayer = CAShapeLayer()
    var gradient = CAGradientLayer()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayers()
        createAnimation()
    }


    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpLayers()
        createAnimation()
    }

    func setUpLayers()
    {
        backgroundMask.lineWidth = lineWidth
        backgroundMask.fillColor = UIColor.clear.cgColor
        backgroundMask.strokeColor = UIColor.blue.cgColor
        grayLayer.lineWidth = lineWidth
        grayLayer.fillColor = nil
        grayLayer.strokeColor = UIColor.gray.cgColor
        gradient.locations = [0.35, 0.5, 0.65]
        gradient.frame = bounds
        gradient.colors = [UIColor.yellow.cgColor, UIColor.red.cgColor, UIColor.blue.cgColor]
        
        let sides = 6
        let rect = self.bounds
        let path = UIBezierPath()
        
        let cornerRadius : CGFloat = 10
        let rotationOffset = CGFloat(.pi / 2.0)
        
        let theta: CGFloat = CGFloat(2.0 * .pi) / CGFloat(sides) // How much to turn at every corner
        let width = min(rect.size.width, rect.size.height)        // Width of the square
        
        let center = CGPoint(x: rect.origin.x + width / 2.0, y: rect.origin.y + width / 2.0)
        
        // Radius of the circle that encircles the polygon
        // Notice that the radius is adjusted for the corners, that way the largest outer
        // dimension of the resulting shape is always exactly the width - linewidth
        let radius = (width - lineWidth + cornerRadius - (cos(theta) * cornerRadius)) / 2.0
        
        
        // Start drawing at a point, which by default is at the right hand edge
        // but can be offset
        var angle = CGFloat(rotationOffset)
        
        let corner = CGPoint(x: center.x + (radius - cornerRadius) * cos(angle), y: center.y + (radius - cornerRadius) * sin(angle))
        path.move(to: CGPoint(x: corner.x + cornerRadius * cos(angle + theta), y: corner.y + cornerRadius * sin(angle + theta)))
        
        for _ in 0..<sides {
            angle += theta
            
            let corner = CGPoint(x: center.x + (radius - cornerRadius) * cos(angle), y: center.y + (radius - cornerRadius) * sin(angle))
            let tip = CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
            let start = CGPoint(x: corner.x + cornerRadius * cos(angle - theta), y: corner.y + cornerRadius * sin(angle - theta))
            let end = CGPoint(x: corner.x + cornerRadius * cos(angle + theta), y: corner.y + cornerRadius * sin(angle + theta))
            
            path.addLine(to: start)
            path.addQuadCurve(to: end, controlPoint: tip)
            
        }
        path.close()
        
        layer.mask = backgroundMask
        backgroundMask.path = path.cgPath
        gradient.mask = backgroundMask
        grayLayer.path = path.cgPath
        layer.addSublayer(grayLayer)
        layer.addSublayer(gradient)
//        layer.addSublayer(backgroundMask)
    }

    func createAnimation()
    {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.duration = 1
        animation.repeatCount = .infinity
        backgroundMask.add(animation, forKey: "MyAnimation")
    }
    
}
