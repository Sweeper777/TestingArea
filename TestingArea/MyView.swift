import UIKit

class MyCell: UITableViewCell {
    @IBOutlet var label: UILabel!
    @IBOutlet var container: UIView!
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            container.backgroundColor = .gray
        } else {
            container.backgroundColor = .white
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            container.backgroundColor = .gray
        } else {
            container.backgroundColor = .white
        }
    }
    
    override func awakeFromNib() {
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.7
        container.layer.shadowOffset = CGSize(width: 3, height: 3)
        container.layer.shadowRadius = 4
        container.layer.cornerRadius = 4
        container.layer.shadowPath = UIBezierPath(roundedRect: container.bounds, cornerRadius: 4).cgPath
        selectionStyle = .none
    }
}
