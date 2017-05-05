import UIKit

class MyTableViewController: UITableViewController {
    
     override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    @IBAction func activity(_ sender: UIBarButtonItem) {
        let activityViewController = UIActivityViewController(activityItems: ["hello world"], applicationActivities: nil)
        navigationController?.present(activityViewController, animated: true) {
            
        }
    }
}
