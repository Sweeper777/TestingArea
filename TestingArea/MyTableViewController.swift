import UIKit
import RxSwift
import RxCocoa

class MyTableViewController: UITableViewController {
    let model = Variable<[String]>(["Tom", "Dick", "Harry", "Donald", "Lucy", "Lily", "Olivia"])
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        tableView.delegate = nil
        tableView.dataSource = nil
        
        model.asObservable().bind(to: tableView.rx.items(cellIdentifier: "myCell", cellType: UITableViewCell.self)) {
            row, model, cell in
            cell.textLabel?.text = model
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(String.self)
            .subscribe(onNext: {
                name in
                if let selectedRowIndexPath = self.tableView.indexPathForSelectedRow {
                    self.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
                }
                _ = self.model.value.remove(object: name)
        }).disposed(by: disposeBag)
    }
}
