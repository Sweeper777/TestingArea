import UIKit
import SwiftyUtils
import CorePlot
import SwiftyJSON

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var graphHostView: CPTGraphHostingView!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func click() {
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        initPlot()
    }
    
    func initPlot() {
        configureHostView()
        configureGraph()
        configureChart()
    }
    
    func configureHostView() {
        graphHostView.allowPinchScaling = false
    }
    
    }
    

extension MyViewController2 : CPTRangePlotDataSource, CPTRangePlotDelegate {
    func numberOfRecords(for plot: CPTPlot) -> UInt {
        return 10
    }
    
    func double(for plot: CPTPlot, field fieldEnum: UInt, record idx: UInt) -> Double {
        return [6,8,9,3,5,7,3,1,2,4][Int(idx)]
    }
}
