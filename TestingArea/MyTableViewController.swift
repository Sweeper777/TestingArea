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
        
    }
}
