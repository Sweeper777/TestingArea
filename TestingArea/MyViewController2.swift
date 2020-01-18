import UIKit
import AVFoundation
import RxSwift
import Eureka
import BigNumber

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    let disposeBag = DisposeBag()
    
    let dict = [
        "1": "value1",
        "2": "value1",
        "3": "value1",
        "4": "value1",
    ]

    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func click() {
        getFib1237s()
        print("===========================")
        alt()
    }
    
    func getFib1237s() {
        // Some temporary variables.
        var a = BInt(0)
        var b = BInt(1)
        var m = BInt(1)
        // Get the numbers until crash...
        while m <= 23 {
            let temp = a
            a = b
            b = b + temp
//            print("a: ", a)
            let str = a.asString(radix: 10)
            let reduced = reduce(str)
            if reduced == "1237"  {
                print(m, "Fib 1237 number is ", a, " | Digits: ", str.count)
                m+=1
            }

        }
    }
    
    func alt() {
        var a = BInt(0)
        var b = BInt(1)
        var m = BInt(1)
        while m <= 23 {
            let temp = a
            a = b
            b = b + temp
            var str = a.asString(radix: 10)
            str = str.replacingOccurrences(of: "9", with: "3")
            str = str.replacingOccurrences(of: "6", with: "23")
            str = str.replacingOccurrences(of: "8", with: "2")
            str = str.replacingOccurrences(of: "4", with: "2")
            if (str.firstIndex(of:"5") == nil) && str.contains("1") && str.contains("2") && str.contains("3") && str.contains("7")  {
                    print(m, "Fib 1237 number is ", a, " | Digits: ", str.count)
                    m+=1
                }

        }
    }
    
    func reduce(_ s: String) -> String {
        let unique = String(Set(s))
        let replaced = unique.replacingOccurrences(of: "9", with: "3")
                                    .replacingOccurrences(of: "6", with: "23")
                                    .replacingOccurrences(of: "8", with: "2")
                                    .replacingOccurrences(of: "4", with: "2")
                                    .replacingOccurrences(of: "0", with: "")
        let sortedUniqueAgain = String(Set(replaced).sorted())
        return sortedUniqueAgain
    }
}
