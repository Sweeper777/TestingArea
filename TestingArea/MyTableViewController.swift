import UIKit
import Combine
import Alamofire
import SCLAlertView

class MyTableViewController: UITableViewController {
    override func viewDidLoad() {
        moreButton.menu = UIMenu(title: "Title", image: UIImage(systemName: "ellipsis"), identifier: nil, options: .destructive, children: [
            UIAction(title: "Action 1", image: UIImage(systemName: "mappin"), handler: { (_) in
                print("Hello World!")
            }),
            UIAction(title: "Action 2", state: .on, handler: { (_) in
                print("Hello World!")
            }),
            UIAction(title: "Action 3", state: .mixed, handler: { (_) in
                print("Hello World!")
            }),
            UIAction(title: "Action 4", attributes: [.destructive], handler: { (_) in
                print("Hello World!")
            }),
            UICommand(title: "Action 5", action: #selector(foo)),
            UIMenu(title: "Title", image: UIImage(systemName: "ellipsis"), identifier: nil, options: .displayInline, children: [
                UIAction(title: "Action 1", image: UIImage(systemName: "mappin"), handler: { (_) in
                    print("Hello World!")
                }),
                UIAction(title: "Action 2", state: .on, handler: { (_) in
                    print("Hello World!")
                }),
                UIAction(title: "Action 3", state: .mixed, handler: { (_) in
                    print("Hello World!")
                }),
                UIAction(title: "Action 4", attributes: [.destructive], handler: { (_) in
                    print("Hello World!")
                }),
                UICommand(title: "Action 5", action: #selector(foo)),
            ])
        ])
    }
    
    @objc func foo() {
        print("Hello World")
    }
    
    }
}

