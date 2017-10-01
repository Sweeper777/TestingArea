import UIKit
import SwiftyUtils
import RxSwift
import RealmSwift

struct RandomItems
{
    var items : [String]
    var seen  = 0
    
    init(_ items:[String])
    { self.items = items }
    
    mutating func next() -> String
    {
        let index = Int(arc4random_uniform(UInt32(items.count - seen)))
        let item  = items.remove(at:index)
        items.append(item)
        seen = (seen + 1) % items.count
        return item
    }
    
    func toPropertyList() -> [String: Any] {
        return [
            "items": items,
            "seen": seen
        ]
    }
    
    init?(propertyList: [String: Any]) {
        guard let items = propertyList["items"] as? [String] else { return nil }
        guard let seen = propertyList["seen"] as? Int else { return nil }
        self.items = items
        self.seen = seen
    }
}

class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    
    let disposeBag = DisposeBag()
    let fontStyles: [UIFontTextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        let myStruct = RandomItems(["a"])
        
        UserDefaults.standard.set(myStruct.toPropertyList(), forKey: "myStruct")
        let retrieved = UserDefaults.standard.object(forKey: "myStruct") as! [String: Any]
        print(RandomItems(propertyList: retrieved)!.items)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func click() {
        
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
    
        }
    }
}
