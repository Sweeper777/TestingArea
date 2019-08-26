import UIKit
import RxDataSources
import RxSwift
import RxCocoa
import EmptyDataSet_Swift
import SwiftyUtils

class MyTableViewController: UITableViewController {
    var strings = [String]() {
        didSet {
            observable.accept(strings)
        }
    }
    
    let observable = BehaviorRelay(value: [String]())
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        tableView.dataSource = nil
        let dataSource = RxTableViewSectionedAnimatedDataSource<StringSection>(configureCell:  {
            (dataSource, collectionView, indexPath, string) -> UITableViewCell in
            let cell = collectionView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = string
            return cell
        })
        
        tableView.emptyDataSetView { (view) in
            view.titleLabelString(NSAttributedString(string: "Nothing to see here!"))
            view.shouldDisplay(true)
        }
        
        observable.asObservable()
            .map {
                [StringSection(items: $0)]
            }
            .bind(to: self.tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        observable.accept(["String"])
    }
}

struct StringSection : AnimatableSectionModelType {
    var items: [String]
    
    init(original: StringSection, items: [String]) {
        self = original
        self.items = items
    }
    
    init(items: [String]) {
        self.items = items
    }
    
    typealias Item = String
    
    typealias Identity = String
    
    var identity: String { return "" }
}
