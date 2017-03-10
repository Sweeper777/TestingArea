import UIKit
import SwiftyUtils
import EZSwiftExtensions
import ASToast
import SCLAlertView
import SwiftyJSON
import Alamofire

class ViewWithCollectionView: UICollectionView, SomeProtocol {
    override func awakeFromNib() {
        collectionViewLayout = SomeLayout(with: self)
    }
}

open class SomeLayout: UICollectionViewLayout, SomeProtocol {
    unowned var delegate: SomeProtocol
    
    init(with delegate: SomeProtocol) {
        self.delegate = delegate
        super.init()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol SomeProtocol: class {}

class X {
    let propertyOfTypeY: Y
    
    init(_ y: Y) {
        propertyOfTypeY = y
    }
}

class Y {
    var propertyOfTypeX: X?
}

class MyViewController2: UIViewController {
    
    @IBOutlet var theView: ViewWithCollectionView!
    @IBOutlet var textView: UITextView!
    @IBOutlet var webView: UIWebView!
    
    var y: Y! = Y()
    var x: X!
    
    override func viewDidLoad() {
        textView.text = "🇨🇳"
        textView.font = UIFont(name: "NotoColorEmoji", size: 37)
        print(UIFont.familyNames)
        textView.inputView?.isUserInteractionEnabled = false
        
        let layer = CAGradientLayer()
        layer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        layer.locations = [0.5]
        self.view.layer.addSublayer(layer)
        
        x = X(y)
        y.propertyOfTypeX = x
        x = nil
        y = nil
    }
    
    @IBAction func btnClicked(sender: UIButton) {
        test4()
    }
    
    func test1() {
        let request = URLRequest(url: URL(string: "https://api.fixer.io/latest?base=HKD")!)
        let task = URLSession.shared.dataTask(with: request) { (data, reponse, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                self.textView.text = String(data: data!, encoding: String.Encoding.utf8)!
            }
        }
        
        task.resume()
    }
    
    func test2() {
        let request = URLRequest(url: URL(string: "https://api.fixer.io/latest?base=HKD")!)
        let task = URLSession.shared.dataTask(with: request) { (data, reponse, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            let json = JSON(data: data!)
            let str = "1 HKD = \(json["rates"]["GBP"].doubleValue)"
            
            DispatchQueue.main.async {
                self.textView.text = str
            }
        }
        
        task.resume()
    }
    
    func test3() {
        let printController = UIPrintInteractionController.shared
        
        let printInfo = UIPrintInfo(dictionary:nil)
        printInfo.outputType = UIPrintInfoOutputType.general
        printInfo.jobName = "some name"
        printController.printInfo = printInfo
        
        let formatter = webView.viewPrintFormatter()
        
        formatter.perPageContentInsets = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
        printController.printFormatter = formatter
        
        printController.present(animated: true, completionHandler: nil)
    }
    
    func test4() {
        Alamofire.request("https://api.fixer.io/latest?base=USD&symbols=EUR,JPY,GBP,AUD,CAD&amount=1").responseString {
            response in
            if let error = response.error {
                print("An error occured: \(error.localizedDescription)")
                return
            }
            DispatchQueue.main.async {
                self.textView.text = response.result.value
            }
        }
    }
    
    func test5() {
        Alamofire.request("https://api.fixer.io/latest?base=HKD").responseString {
            response in
            if let error = response.error {
                print("An error occured: \(error.localizedDescription)")
                return
            }
            DispatchQueue.main.async {
                self.textView.text = "1 HKD = \(JSON(parseJSON: response.result.value!)["rates"]["GBP"].doubleValue) GBP"
            }
        }
    }
    
    func home() {
        print("Home tapped")
    }
    
    func settings() {
        print("Settings tapped")
    }
    
    @IBAction func changed() {
        print("changed")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
