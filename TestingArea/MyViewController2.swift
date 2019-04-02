import UIKit
import SwiftyUtils
import SwiftyJSON

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("my document").appendingPathExtension(MyDataDocument.fileExtension)
        let myDataDocument = MyDataDocument(fileURL: url)
        try? myDataDocument.read(from: url)
        textfield.text = myDataDocument.myData.myString
    }
    @IBAction func click() {
        let myData = MyData(myInt: 10, myString: "hello", myArray: ["item 1", "item 2"])
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("my document").appendingPathExtension(MyDataDocument.fileExtension)
        let myDataDocument = MyDataDocument(fileURL: url)
        myDataDocument.myData = myData
        myDataDocument.save(to: url, for: .forOverwriting, completionHandler: { print($0) })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

struct MyData : Codable {
    var myInt: Int
    var myString: String
    var myArray: [String]
}

class MyDataDocument: UIDocument {
    static let fileExtension = "mydoc"
    
    var myData: MyData = MyData(myInt: 0, myString: "", myArray: []) {
        didSet {
            updateChangeCount(.done)
        }
    }
    
    override func contents(forType typeName: String) throws -> Any {
        let encoder = JSONEncoder()
        let data = try encoder.encode(myData)
        return data
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        guard let data = contents as? Data else {
            throw DocumentError.unknownType
        }
        let decoder = JSONDecoder()
        myData = try decoder.decode(MyData.self, from: data)
    }
}

enum DocumentError: Error {
    case unknownType
}
