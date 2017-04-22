import UIKit
import SwiftyUtils
import SwiftyJSON
import Alamofire
import FTPopOverMenu_Swift
import SJFluidSegmentedControl

class MyViewController2: UIViewController, SJFluidSegmentedControlDataSource {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    
    @IBOutlet var segmentedControl: SJFluidSegmentedControl!
    
    override func viewDidLoad() {
        segmentedControl.dataSource = self
    }
    
    @IBAction func click() {
        
    }
    
    func numberOfSegmentsInSegmentedControl(_ segmentedControl: SJFluidSegmentedControl) -> Int {
        return 4
    }
}
