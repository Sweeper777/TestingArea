import UIKit
import RxSwift
import RxCocoa
import SwiftyUtils

class SimpleViewModel {
    var list = BehaviorRelay<[String]>(value: [])
    var randomString = BehaviorRelay<String>(value: "")
    
    func fetch() {
        // Request...
        list.accept(["result1", "result2", "result3"])
        randomString.accept("Random...")
    }
}

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var image: UIImageView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    let tableView = UITableView()
    let viewModel = SimpleViewModel()
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Observable.combineLatest(viewModel.list, viewModel.randomString)
            .map { (list, randomString) in list.map { (element: $0, randomString: randomString) } }
    .bind(to: tableView.rx.items(cellIdentifier: "cell")) {
    (index, model, cell) in
        cell.textLabel?.text = model.element + model.randomString
    }.disposed(by: disposeBag)
    }
    
    
    @IBAction private func click() {
        
    }
}
