import UIKit

class MyCell: UITableViewCell {
    @IBOutlet var label: UILabel!
    @IBOutlet var container: UIView!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = .gray
            } else {
                backgroundColor = .white
            }
        }
    }
}
