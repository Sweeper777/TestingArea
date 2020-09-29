import UIKit
import SCLAlertView
import RxSwift
import RxCocoa
import Stencil

class MyViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let environment = Environment(loader: FileSystemLoader(bundle: [Bundle.main]))
//            let template = try environment.loadTemplate(name: "someLogic.stencil")
            let context = [
                "array1": [["property1": "Hello"], ["property1": "World"], ["property1": "Bye"]],
                "array2": [["property1": "A"], ["property1": "B"], ["property1": "C"]],
//                "someLogic.stencil": template
            ] as [String : Any]
            let rendered = try environment.renderTemplate(name: "template1.stencil", context: context)
            print(rendered)
        } catch {
            print(error)
        }
    }
    
    deinit {
        print("deinit")
    }
}
