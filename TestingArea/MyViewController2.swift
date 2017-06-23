import UIKit
import SwiftyUtils
import FirebaseAuth
import GoogleSignIn
import Eureka
import Alamofire
import RxSwift
import RxCocoa
import Instructions

class MyViewController2: UIViewController, GIDSignInUIDelegate, CoachMarksControllerDelegate, CoachMarksControllerDataSource {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    
    let disposeBag = DisposeBag()
    let cmController = CoachMarksController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cmController.dataSource = self
        cmController.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cmController.start(on: self)
    }
    
    func numberOfCoachMarks(for coachMarksController: CoachMarksController) -> Int {
        return 3
    }
    
    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkAt index: Int) -> CoachMark {
        return test6()
    }
    
    func test5(_ index: Int) -> CoachMark {
        switch index {
        case 0:
            return cmController.helper.makeCoachMark(for: textfield)
        case 1:
            return cmController.helper.makeCoachMark(for: textview)
        case 2:
            return cmController.helper.makeCoachMark(for: button)
        default:
            return cmController.helper.makeCoachMark()
        }
    }
    
    func test6() -> CoachMark {
        return cmController.helper.makeCoachMark()
    }
    
    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: CoachMark) -> (bodyView: CoachMarkBodyView, arrowView: CoachMarkArrowView?) {
        let coachViews = coachMarksController.helper.makeDefaultCoachViews(withArrow: true, arrowOrientation: coachMark.arrowOrientation)
        switch index {
        case 0:
            coachViews.bodyView.hintLabel.text = "This is a text field"
        case 1:
            coachViews.bodyView.hintLabel.text = "This is a text view"
        case 2:
            coachViews.bodyView.hintLabel.text = "This is a button"
        default:
            break
        }
        coachViews.bodyView.nextLabel.text = "Ok!"
        
        return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
    }
        
    @IBAction func click() {
        
    }
}
