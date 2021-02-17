import UIKit
import SCLAlertView
import RxSwift
import RxCocoa
import GridLayout
import PaddingLabel

class MyViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLayoutConstraint.activate([
        ])
    }
    
    func test1() -> UIView {
        let gridItems = (0..<31).map {
            GridItem(generateLabel(text: "\($0 + 1)"), row: $0 % 7, column: $0 / 7)
        }
        let grid = UIView.gridLayoutView(items: gridItems,
                                         rows: Array(repeating: .auto, count: 7),
                                         columns: Array(repeating: .auto, count: 5))
        return grid
    }
    
    func test2() -> UIView {
        var white = true
        var gridItems = [GridItem]()
        for i in 0..<31 {
            gridItems.append(
                GridItem(generateLabel(
                            text: "\(i + 1)",
                            textColor: white ? .black : .white,
                            bgColor: white ? .white : .black),
                         row: i % 7, column: i / 7,
                         horizontalAlignment: .stretch)
            )
            white.toggle()
        }
        let grid = UIView.gridLayoutView(items: gridItems,
                                         rows: Array(repeating: .fill, count: 7),
                                         columns: Array(repeating: .fill, count: 5))
        return grid
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
