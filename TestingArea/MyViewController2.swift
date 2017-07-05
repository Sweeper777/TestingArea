import UIKit
import SwiftyUtils
import FirebaseAuth
import GoogleSignIn
import Eureka
import Alamofire
import RxSwift
import RxCocoa
import SkyFloatingLabelTextField
import ObjectMapper
import SwiftyJSON

class MyViewController2: UIViewController, GIDSignInUIDelegate {
    @IBOutlet var textfield: SkyFloatingLabelTextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    
    let disposeBag = DisposeBag()
    let fontStyles: [UIFontTextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        textview.text = "Testing Testing Testing"
    }
    
    func test1() {
        textfield.addTarget(self, action: #selector(test2), for: .valueChanged)
    }
    
    func test2() {
        print("Changed")
    }
    
    @IBAction func click() {
        
    }
    
    func test3() {
        let question = Question(type: 1, questionText: "Hello", possibleAnswers: ["A"], hint: "Some Hint")
        print(question.toJSONString()!)
    }
    
    func test4() {
        print(Question(JSONString: "{\"hint\":\"Some Hint\",\"possibleAnswers\":[\"A\"],\"type\":1,\"questionText\":\"Hello\"}")!.toJSONString()!)
    }
    
    func test5() {
        let base64 = "eyJuYW1lIjoiTm8iLCJxdWVzdGlvbnMiOlt7ImhpbnQiOiIiLCJwb3NzaWJsZUFuc3dlcnMiOlsiQiIsIkMiLCJEIl0sInR5cGUiOjIsInF1ZXN0aW9uVGV4dCI6IldoaWNoIG9mIHRoZSBmb2xsb3dpbmcgaXMgdHJ1ZT8gU2VsZWN0IGFsbCBvcHRpb25zLlxuQS4gQWxsIGFuaW1hbCBjZWxscyBkaXZpZGUgYnkgbWl0b3Npc1xuQi4gUGxhbnQgY2VsbHMgaGF2ZSBhIGNlbGwgd2FsbFxuQy4gU3RhY2sgT3ZlcmZsb3cgaXMgdGhlIGJlc3Qgc2l0ZSBldmVyXG5ELiBUaGUgSHVuZ2FyaWFuIHVwcmlzaW5nIG9jY3VycmVkIGluIDE5NTYifSx7ImhpbnQiOm51bGwsInBvc3NpYmxlQW5zd2VycyI6WyJBIl0sInR5cGUiOjEsInF1ZXN0aW9uVGV4dCI6IkhlbGxvIn1dLCJncmFkZUJvdW5kYXJpZXMiOlsyMCw0MCw2MCw3MCw4NV19"
        let jsonString = JSON(data: Data(base64Encoded: base64)!).rawString()
        print((try! Quiz(JSONString: jsonString!)).toJSONString(prettyPrint: true)!)
    }
    
    func test6() {
        let blur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = CGRect(origin: .zero, size: UIScreen.size)
        (UIApplication.shared.delegate as! AppDelegate).window?.addSubview(blurView)
    }
    
    func test7() {
        let blur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = CGRect(origin: .zero, size: UIScreen.size)
        blurView.alpha = 0
        (UIApplication.shared.delegate as! AppDelegate).window?.addSubview(blurView)
        UIView.animate(withDuration: 3) {
            blurView.alpha = 1
        }
    }
    
}

class Question: Mappable {
    var type: Int?
    var questionText: String?
    var possibleAnswers: [String]?
    var hint: String?
    
    init(type: Int, questionText: String, possibleAnswers: [String], hint: String?) {
        self.type = type
        self.questionText = questionText
        self.possibleAnswers = possibleAnswers
        self.hint = hint
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        type <- map["type"]
        questionText <- map["questionText"]
        possibleAnswers <- map["possibleAnswers"]
        hint <- map["hint"]
    }
}

class Quiz: ImmutableMappable {
    let name: String
    let gradeBoundaries: [Int]
    let questions: [Question]
    
    init(name: String, questions: [Question], gradeBoundaries: [Int]) {
        self.name = name
        self.questions = questions
        self.gradeBoundaries = gradeBoundaries
    }
    
    required init(map: Map) throws {
        name = try map.value("name")
        gradeBoundaries = try map.value("gradeBoundaries")
        questions = try map.value("questions")
    }
    
    func mapping(map: Map) {
        name >>> map["name"]
        gradeBoundaries >>> map["gradeBoundaries"]
        questions >>> map["questions"]
    }
}
