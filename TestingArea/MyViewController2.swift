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
