import UIKit
import SwiftyUtils
import SwiftyJSON
import Alamofire

class MyViewController2: UIViewController {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    override func viewDidLoad() {
        textfield.alpha = 0
    }
    
    @IBAction func click() {
        print(textfield.isHidden)
    }
    
    func test1() {
        var json = JSON(dictionaryLiteral: ("name", "My Quiz"), ("questions", [Any]()))
        json["questions"] = [["text": "", "type": "", "answer": "", "hint": ""]]
        json["questions"][0]["text"] = "What is your name?"
        json["questions"][0]["type"] = "fib"
        json["questions"][0]["answer"] = "Mulang"
        json["questions"][0]["hint"] = "Begins with an 'M'"
        let data = try! json.rawData()
        print("JSON Data Size: \(data.count) Bytes")
        let jsonStringData = json.rawString()!.data(using: .utf8)!
        print("JSON String Data Size: \(jsonStringData.count) Bytes")
        let encodedJSON = data.base64EncodedString().data(using: .utf8)!
        print("Encoded JSON Size: \(encodedJSON.count) Bytes")
    }
}
