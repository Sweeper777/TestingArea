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
        segmentedControl.cornerRadius = segmentedControl.height / 2
    }
    
    @IBAction func click() {
        
    }
    
    func numberOfSegmentsInSegmentedControl(_ segmentedControl: SJFluidSegmentedControl) -> Int {
        return 4
    }
    
    func segmentedControl(_ segmentedControl: SJFluidSegmentedControl, titleForSegmentAtIndex index: Int) -> String? {
        switch index {
        case 0: return "Hello"
        case 1: return "Hey Bro"
        case 2: return "Goodbye"
        case 3: return "Exit"
        default: return ""
        }
    }
}
