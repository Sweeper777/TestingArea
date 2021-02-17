import UIKit
import SCLAlertView
import RxSwift
import RxCocoa

class MyViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLayoutConstraint.activate([
        ])
    }
    
    }
    
    
    func generateLabel(text: String, textColor: UIColor = .black, bgColor: UIColor = .white) -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = bgColor
        label.textColor = textColor
        label.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 1
        label.textAlignment = .center
        return label
    }
    
    func generatePaddingLabel(text: String, textColor: UIColor = .black, bgColor: UIColor = .white) -> UILabel {
        let label = PaddingLabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = bgColor
        label.textColor = textColor
        label.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 1
        label.textAlignment = .center
        label.topInset = 3
        label.leftInset = 3
        label.rightInset = 3
        label.bottomInset = 3
        return label
    }
}
