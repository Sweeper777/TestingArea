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
    @IBOutlet var datePicker: UIDatePicker!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    let disposeBag = DisposeBag()
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.addTarget(self, action: #selector(click), for: .valueChanged)
        textview.isEditable = false
        textview.isScrollEnabled = true
        let foo = Foo()
        button.addTarget(foo, action: #selector(foo.foo), for: .touchUpInside)
        view.setContentHuggingPriority(.required, for: .vertical)
    }
    
    @IBAction private func click() {
        let vc = UIStoryboard.main?.instantiateViewController(identifier: "ProblemVC")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("")
    }
}

extension MyViewController2: UISearchControllerDelegate, UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("clicked")
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print("clicked")
    }
}

class Foo: NSObject {
    @objc func foo() {
        print("clicked")
    }
}
