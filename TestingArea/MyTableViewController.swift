import UIKit
import Combine
import Alamofire
import SCLAlertView

class MyTableViewController: UITableViewController {
    @IBOutlet var moreButton: UIBarButtonItem!
    
    let data = ["Hello", "World", "Some", "Text"]

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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (_) -> UIMenu? in
            UIMenu(title: self.data[indexPath.row], image: UIImage(systemName: "ellipsis"), identifier: nil, options: .displayInline, children: [
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
            ])
        }
    }
}

