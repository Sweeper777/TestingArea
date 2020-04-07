import UIKit
import SwiftyUtils
import SwiftyJSON

class MyTableViewController: UITableViewController {
    @IBOutlet var myView: UIView!
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 && indexPath.row == 0 {
            return tableView.width
        } else {
            return UITableView.automaticDimension
        }
    }
}

