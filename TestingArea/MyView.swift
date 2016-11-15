import Eureka
import UIKit

class MyView: UIView {
    var view2: UIView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(touches.first!.location(in: view2))
    }

    override func draw(_ rect: CGRect) {
        view2 = UIButton(frame: CGRect(x: 30, y: 30, width: 30, height: 30))
        view2.isUserInteractionEnabled = false
        view2.backgroundColor = UIColor.blue
        self.addSubview(view2)
    }
}

class CustomSelectorVC : UIViewController, TypedRowControllerType {
    public var onDismissCallback: ((UIViewController) -> ())?
    var row: RowOf<Int>!
    var completionCallback: ((UIViewController) -> ())?
    
    override func viewDidLoad() {
        row.value! += 1
    }
}

final class CustomRow: SelectorRow<PushSelectorCell<Int>, CustomSelectorVC> {
    required init(tag: String?, _ initializer: ((CustomRow) -> ())) {
        super.init(tag: tag)
        initializer(self)
        presentationMode = PresentationMode.show(controllerProvider: ControllerProvider.storyBoard(storyboardId: "CustomSelectorVC", storyboardName: "Main", bundle: nil), onDismiss: {
            _ in
        })
        displayValueFor = {
            guard let val = $0 else { return "" }
            return "\(val)"
        }
    }
    
    required convenience init(tag: String?) {
        self.init(tag: tag)
    }
}
