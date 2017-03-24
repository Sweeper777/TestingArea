import UIKit
import SwiftyUtils
import EZSwiftExtensions
import SwiftyJSON

class MyViewController2: UIViewController {
    override func viewDidLoad() {
        test3()
    }
    
    func test1() {
        let json = JSON(dictionaryLiteral: ("name", "My Quiz"), ("questions", [Any]()))
        print(json)
    }
    
    func test2() {
        var json = JSON(dictionaryLiteral: ("name", "My Quiz"), ("questions", [Any]()))
        json["questions"] = [["text": "", "type": "", "answer": "", "hint": ""]]
        json["questions"][0]["text"] = "What is your name?"
        json["questions"][0]["type"] = "fib"
        json["questions"][0]["answer"] = "Mulang"
        json["questions"][0]["hint"] = "Begins with an 'M'"
        print(json)
    }
    
    func test3() {
        var json = JSON(dictionaryLiteral: ("name", "My Quiz"), ("questions", [Any]()))
        json["questions"] = [["text": "", "type": "", "answer": "", "hint": ""]]
        json["questions"][0]["text"] = "What is your name?"
        json["questions"][0]["type"] = "fib"
        json["questions"][0]["answer"] = "Mulang"
        json["questions"][0]["hint"] = "Begins with an 'M'"
        let data = try! json.rawData()
        print(String.init(data: data, encoding: .utf8)!)
    }
}
