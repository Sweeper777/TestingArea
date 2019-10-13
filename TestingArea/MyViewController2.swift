import UIKit
import AVFoundation
import RxSwift

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var imageView: UIImageView!
    
    let disposeBag = DisposeBag()

    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func click() {
        let number = Int(textfield.text!)!
        let entity = Entity()
        entity.number = number
        try? RealmWrapper.shared.realm.write {
            RealmWrapper.shared.realm.add(entity)
        }
        print(RealmWrapper.shared.entities.map { $0.number } as [Int])
    }
    
}
