import UIKit

class MyCell: UICollectionViewCell {
    @IBOutlet var textLabel: UILabel!
    
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
