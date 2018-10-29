import UIKit
import SwiftyUtils
import RxSwift
import SceneKit
import SwiftyJSON
import SwiftCharts

class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var blueView: MyView!
    @IBOutlet var greenView: UIView!
    
    
    let disposeBag = DisposeBag()
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueView.isUserInteractionEnabled = true
        greenView.isUserInteractionEnabled = true
        
        blueView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(blueViewTapped)))
        greenView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(greenViewTapped)))
    }
    
    @objc func blueViewTapped() {
        print("Blue view tapped")
    }
    
    @objc func greenViewTapped() {
        print("Green view tapped")
    }
    
    @IBAction func click() {
        var triangularArray: TriangularArray<Int> = [
            [1],
            [2, 3],
            [4, 5, 6],
            [7, 8, 9, 10],
            [11, 12, 13, 14, 15],
            [16, 17, 18, 19, 20, 21],
        ]
        
        for element in triangularArray {
            print(element)
        }
        
        print("----")
        
        print(triangularArray[3, 1]!)
        triangularArray[3, 1] = 999
        print(triangularArray[3, 1]!)
        print(triangularArray[1, 3] ?? "Nil")
        
        print("----")
        print(triangularArray.adjacentIndices(forRow: 0, index: 0))
        print(triangularArray.adjacentIndices(forRow: 4, index: 0))
        print(triangularArray.adjacentIndices(forRow: 3, index: 1))
    }
}
