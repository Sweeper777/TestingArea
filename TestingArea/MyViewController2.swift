import UIKit
import SwiftyUtils
import SnapKit
import SwiftyJSON

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    var constraintRelativeToHeight: Constraint!
    var constraintRelativeToWidth: Constraint!
    
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = UIView(frame: .zero)
        myView.backgroundColor = .green
        view.addSubview(myView)
        myView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(myView.snp.height).dividedBy(1.2)
//            make.height.equalTo(UIScreen.main.nativeBounds.height / UIScreen.main.nativeScale / 7)
            constraintRelativeToHeight = make.height.equalTo(view.snp.height).dividedBy(7).constraint
            constraintRelativeToWidth = make.width.equalTo(view.snp.width).dividedBy(7).constraint
        }
        
        if traitCollection.horizontalSizeClass == .compact &&
            traitCollection.verticalSizeClass == .regular {
            constraintRelativeToWidth.deactivate()
            constraintRelativeToHeight.activate()
        } else {
            constraintRelativeToWidth.activate()
            constraintRelativeToHeight.deactivate()
        }
    }
    
    @IBAction func click() {
        let jsonString = """
[
{
"sno": "21",
"title": "title 1",
"tableid": "table 1"
},
{
"sno": "19",
"title": "title 222",
"tableid": "table 222"
},
{
"sno": "3",
"title": "title 333",
"tableid": "table 333"
}
]
"""
        let json = JSON(parseJSON: jsonString)
        print(json[0]["sno"].string)
    }
    
    override func overrideTraitCollection(forChild childViewController: UIViewController) -> UITraitCollection? {
        if view.bounds.width < view.bounds.height {
            return UITraitCollection(horizontalSizeClass: .compact)
        } else {
            return UITraitCollection(horizontalSizeClass: .regular)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (context) in
            if self.traitCollection.horizontalSizeClass == .compact &&
                self.traitCollection.verticalSizeClass == .regular {
                self.constraintRelativeToWidth.deactivate()
                self.constraintRelativeToHeight.activate()
            } else {
                self.constraintRelativeToWidth.activate()
                self.constraintRelativeToHeight.deactivate()
            }
        }, completion: nil)

    }
}
