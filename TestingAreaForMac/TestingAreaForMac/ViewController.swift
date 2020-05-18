import Cocoa
import SwiftyXMLParser
import Automator

class ViewController: NSViewController {
    
    @IBOutlet var slider: NSSlider!
    @IBOutlet var myView: MyView!
    
    var svgStrings: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        let xmlString = try! String(contentsOfFile: Bundle.main.path(forResource: "map", ofType: "svg")!)
        let xml = try! XML.parse(xmlString)
        svgStrings = Array(xml["svg", "g" ,"path"])
            .map { $0.attributes["d"]! }
            .map(editSVGString)
        myView.svgStrings = svgStrings
        slider.minValue = 0
        slider.maxValue = Double(svgStrings.count)
        slider.integerValue = svgStrings.count
        slider.isContinuous = true
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()

        let dd = dateFromString("Aug 20", format: "MMM yy")
        
        print("")
    }
    
    func dateFromString(_ dateString:String,  format: String = "dd/MM/yy") -> Date?
    {
        let dueDateFormatter = DateFormatter()
        dueDateFormatter.timeZone = TimeZone(identifier: "UTC")!
        dueDateFormatter.dateFormat = format
        let date = dueDateFormatter.date(from: dateString)
        return date
     }
    
    func editSVGString(_ string: String) -> String {
        let uppercased = string.uppercased()
//            if !uppercased.hasSuffix("Z") {
//                return uppercased + "Z"
//            } else {
            return uppercased
//            }
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        myView.svgStrings = [svgStrings[slider.integerValue - 1]]
    }
    
}

struct Foo {
    let a: Date
}
