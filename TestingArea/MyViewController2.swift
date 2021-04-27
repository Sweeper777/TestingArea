import UIKit
import RxSwift
import RxCocoa
import SwiftyUtils
import SwiftUI

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var label: UILabel!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    let disposeBag = DisposeBag()
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.addTarget(self, action: #selector(click), for: .valueChanged)
        let str = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip jojfsfoehfhsuhfieuhsfliushfglislifhushfuhfpuhdwehfwiebfwghiguusd fhnerhfuhwof uwhfu9 whefh9 egerhg ehruhg rldf huehr gurehg erghu ehifhpr ehgpehs ghg he hr gehhrhughregh ehurhgue r ghehrg ehheru hgghehg "
        let attrStr = NSAttributedString(string: str, attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                                       .foregroundColor: UIColor.black,
                                                                       .baselineOffset: 10])
        textview.isEditable = false
        textview.isScrollEnabled = true

        label.numberOfLines = 0

        textview.attributedText = attrStr
        label.attributedText = attrStr
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        definesPresentationContext = true

        searchController.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.searchResultsUpdater = self

        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search channels"

        // search icon settings
        searchController.searchBar.searchTextField.leftView?.tintColor = .link
        searchController.searchBar.setImage(UIImage(systemName: "globe"), for: .bookmark, state: .normal)
//        searchController.searchBar.showsSearchResultsButton = true
        searchController.searchBar.showsBookmarkButton = true
    }
    
    @IBAction private func click() {
        presentedViewController?.dismiss(animated: true, completion: nil)
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: [.pdf])
        present(picker, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("")
    }
}

extension MyViewController2: UISearchControllerDelegate, UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("clicked")
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print("clicked")
    }
}
