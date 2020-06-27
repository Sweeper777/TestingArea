import UIKit
import Combine
import Alamofire
import TimelineTableViewCell

class MyTableViewController: UITableViewController {

    var things = ["xxxx", "Two\nLines", "xxxxx"]
    var dates = ["xxxx", "xxxxx", "xxxxx"]
    
    override func viewDidLoad() {
        let bundle = Bundle(for: TimelineTableViewCell.self)
        let nibUrl = bundle.url(forResource: "TimelineTableViewCell", withExtension: "bundle")
        let timelineTableViewCellNib = UINib(nibName: "TimelineTableViewCell",
            bundle: Bundle(url: nibUrl!)!)
        tableView.register(timelineTableViewCellNib, forCellReuseIdentifier: "TimelineTableViewCell")
//        tableView.separatorStyle = .none
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else {
            return things.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return tableView.dequeueReusableCell(withIdentifier: "cell")!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell",
                                                     for: indexPath) as! TimelineTableViewCell
            if indexPath.row == 0 {
                cell.timeline.frontColor = .clear
                cell.timeline.backColor = .black
            } else if indexPath.row == things.count - 1{
                cell.timeline.frontColor = .black
                cell.timeline.backColor = .clear
            } else {
                cell.timeline.frontColor = .black
                cell.timeline.backColor = .black
            }
            cell.titleLabel.text = things[indexPath.row]
            cell.timeline.leftMargin = 120
            cell.lineInfoLabel.text = "Lorem Ipsum. Hello World! Long Long Long Text"
            cell.illustrationImageView.image = UIImage(systemName: "person.circle.fill")
            cell.timelinePoint.diameter = 25
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.width)
            return cell
        }
    }
    
    @IBAction func buttonTapped() {
        things.append("Thing 4")
        dates.append("2020-07-01")
        tableView.insertRows(at: [IndexPath(row: things.count - 1, section: 1)], with: .automatic)
        tableView.reloadRows(at: [IndexPath(row: things.count - 2, section: 1)], with: .automatic)
    }
}

