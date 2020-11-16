import UIKit
import RxSwift
import RxCocoa
import TagWriteView
import SwiftyUtils
import TagsPanelView

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var image: UIImageView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    let disposeBag = DisposeBag()
    
    var tagWriteView: TagWriteView!
    var tagsPanelView: TagsPanelView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UIScreen.main.scale)
        tagWriteView = TagWriteView()
        tagWriteView.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        view.addSubview(tagWriteView)
        tagWriteView.translatesAutoresizingMaskIntoConstraints = false
        tagWriteView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tagWriteView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tagWriteView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tagWriteView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        tagWriteView.delegate = self
        tagWriteView.layer.borderWidth = 1
        tagWriteView.layer.borderColor = UIColor.black.cgColor
        
        tagsPanelView = TagsPanelView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        view.addSubview(tagsPanelView)
        tagsPanelView.translatesAutoresizingMaskIntoConstraints = false
        tagsPanelView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tagsPanelView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tagsPanelView.topAnchor.constraint(equalTo: tagWriteView.bottomAnchor, constant: 20).isActive = true
        tagsPanelView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        tagsPanelView.tagArray = ["hello", "world", "many", "tags", "more", "cool", "stuff", "overflow"]
        tagsPanelView.tagsBackgroundColorsArray = Array(repeating: .blue, count: 8)
        
    }
    
    @IBAction private func click() {
//        test2()
    }
}

extension MyViewController2 : TagWriteViewDelegate {
    func tagWriteView(view: TagWriteView!, didMakeTag tag: String!) {
        print("Made tag: \(tag!)")
    }
    func tagWriteView(view: TagWriteView!, didRemoveTag tag: String!) {
        print("Removed tag: \(tag!)")
    }
}
