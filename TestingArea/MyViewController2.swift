import UIKit
import SwiftyUtils
import FirebaseAuth
import GoogleSignIn
import Eureka
import Alamofire
import PromiseKit

class MyViewController2: FormViewController, GIDSignInUIDelegate {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
    }
    
    func test1() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func test2() {
    }
        
    @IBAction func click() {
        
    }
    
    
}

public protocol Protocol1 {
    associatedtype RequestType
    associatedtype ResultType
    func execute(req: RequestType) -> Promise<ResultType>
}

struct Implemented1 : Protocol1 {
    typealias ResultType = Bool
    typealias RequestType = String
    func execute(req : String) -> Promise<Bool> {
        return Promise { fulfill, reject in
            fulfill(true)
        }
    }
}
func login() -> Promise<NSDictionary> {
    return Promise.init { fulfill, reject in
        Alamofire.request(try! URLRequest(url: "", method: .get))
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let dict):
                    fulfill(dict as! NSDictionary)
                case .failure(let error):
                    reject(error)
                }
        }
    }
}
