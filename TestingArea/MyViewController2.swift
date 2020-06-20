import UIKit
import RxSwift
import RxCocoa
import CouchbaseLiteSwift

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    let disposeBag = DisposeBag()
    
    var database: Database!
    var document: MutableDocument!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            database = try Database(name: "my-database")
            document = MutableDocument()
                   .setString("John", forKey: "firstName")
            try database.saveDocument(document)
            print(database.path)
        } catch {
            print(error)
        }
    }
    
    
    @IBAction func click() {
        
    }
}
