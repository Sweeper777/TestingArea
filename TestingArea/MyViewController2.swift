import UIKit
import RxSwift
import RxCocoa
import SwiftyJSON

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let demo = CustomView(frame: view.frame)

        view.addSubview(demo)
        
        
        demo.customButton.addTarget(self, action: #selector(click), for: .touchUpInside)
    }
    
    
    @IBAction func click() {
        print("Hello")
    }
}

public class CustomView: UIView {

    var topConstraint: NSLayoutConstraint!

    public let customButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        button.setTitleColor(.red, for: .normal)
        
        return button
    }()

    public var buttonWidth: CGFloat = 100

    public override init(frame: CGRect) {
        super.init(frame: frame)
        initConstraints()
    }


    private func initConstraints(){
        addSubview(customButton)
        topConstraint = customButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80)
        NSLayoutConstraint.activate([
            
            topConstraint,
            customButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            customButton.widthAnchor.constraint(equalToConstant: buttonWidth)

        ])
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class FrameworkView: UIView {

    let customButton: CustomView = {
        let cusomView = CustomView()
        cusomView.translatesAutoresizingMaskIntoConstraints = false
        return cusomView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initConst()
    }

    func initConst()  {
        
        addSubview(customButton)
        NSLayoutConstraint.activate([
            customButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            customButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            customButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
//            customButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
