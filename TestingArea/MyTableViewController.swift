import UIKit
import RxSwift
import RxDataSources
import RxCocoa
import EmptyDataSet_Swift

class MyTableViewController: UITableViewController {
    let observable = Variable<[String]>(["Hello", "World", "Bye", "Foo", "Bar"])
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        tableView.dataSource = nil
        tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "cell")
        let dataSource = RxTableViewSectionedAnimatedDataSource<StringSection>(configureCell:  {
            (dataSource, tableView, indexPath, string) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCell
            cell.label.text = string
            return cell
        })
        tableView.separatorStyle = .none
        
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 61
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
