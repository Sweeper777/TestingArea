import UIKit
import SwiftyUtils

class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField! {
        didSet {
            print("XXXXXXXXXX \(textfield)")
        }
    }
    @IBOutlet var button: UIButton!
    @IBOutlet var barChart: BarChartView!
    
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        barChart.percentages = [
            (0.5, 0.7, 0.6, 0.3),
            (1.0, 0.3, 0.6, 0.8),
            (1.0, 0.5, 0.7, 0.3),
            (0.8, 0.5, 0.5, 0.9),
            (0.9, 0.3, 0.4, 0.5),
            (1.0, 0.4, 0.5, 0.6),
            (0.5, 0.9, 0.8, 0.7)
        ]
    }
    
    @IBAction func click() {
        }
    }
}
