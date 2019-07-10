import UIKit

class MyCell: UITableViewCell {
    @IBOutlet var label: UILabel!
    @IBOutlet var container: UIView!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                container.backgroundColor = .gray
            } else {
                container.backgroundColor = .white
            }
        }
    }
    
    override func awakeFromNib() {
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.5
        container.layer.shadowOffset = CGSize(width: 3, height: 3)
        container.layer.shadowRadius = 4
        container.layer.shadowPath = UIBezierPath(rect: container.bounds).cgPath
    }
}
