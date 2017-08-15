import UIKit
import SwiftyUtils
import RxSwift
import Eureka

class MyViewController2: FormViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    let disposeBag = DisposeBag()
    let fontStyles: [UIFontTextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hello"
        form +++ MySelectorRow(tag: "someTag") {
            row in
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem()
        self.navigationItem.backBarButtonItem!.title = ""
    }
    
    @IBAction func click() {
    }
}

class SelectorController: UIViewController, TypedRowControllerType {
    public var onDismissCallback: ((UIViewController) -> ())?
    var row: RowOf<Int>!
    var completionCallback: ((UIViewController) -> ())?
}

class MySelectorRow: SelectorRow<PushSelectorCell<Int>, SelectorController> {
    required init(tag: String?, _ initializer: ((MySelectorRow) -> ())) {
        super.init(tag: tag)
        initializer(self)
        presentationMode = PresentationMode.show(controllerProvider: ControllerProvider.storyBoard(storyboardId: "first", storyboardName: "Main", bundle: nil), onDismiss: {
            _ in
        })
    }
    
    required convenience init(tag: String?) {
        self.init(tag: tag)
    }
}
