import UIKit
import SwiftyUtils
import RxSwift
import SceneKit

class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    @IBOutlet var sceneView: SCNView!
    var scene: MyScene!
    
    let disposeBag = DisposeBag()
    let fontStyles: [UIFontTextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        scene = MyScene()
        sceneView.scene = scene
        scene.setup()
        sceneView.allowsCameraControl = true
        sceneView.backgroundColor = .black
        sceneView.showsStatistics = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func click() {
        if textfield.isEditing {
            view.endEditing(true)
        } else {
            scene.executeCommand(textfield.text!)
        }
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
    
}
@IBDesignable class UIButtonRounded: UIButton
{
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    @IBInspectable var border: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    @IBInspectable var radious: CGFloat = 0 {
        didSet {
            updateCornerRadius()
        }
    }
    
}
