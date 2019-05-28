import UIKit
import RxSwift
import RxDataSources
import RxCocoa

class MyTableViewController: UITableViewController {
    let observable = Variable(["Hello", "World", "Bye", "Foo", "Bar"])
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        tableView.dataSource = nil
        let dataSource = RxTableViewSectionedAnimatedDataSource<StringSection>(configureCell:  {
            (dataSource, tableView, indexPath, string) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
            cell.textLabel?.text = string
            return cell
        })
        observable.asObservable()
            .map {
                [StringSection(items: $0)]
            }
            .bind(to: self.tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        observable.value.remove(at: observable.value.count - 1)
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
