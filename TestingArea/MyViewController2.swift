import UIKit
import SwiftyUtils
import SwiftyJSON
import Alamofire
import FTPopOverMenu_Swift
import Eureka
import FirebaseAuth
import FirebaseStorage
import GoogleSignIn

public struct MyOptions: OptionSet {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let one = MyOptions(rawValue: 1 << 0)
    public static let two = MyOptions(rawValue: 1 << 1)
}

class MyViewController2: UIViewController, GIDSignInUIDelegate {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    
    var storage: FIRStorageReference!
    
    override func viewDidLoad() {
        storage = FIRStorage.storage().reference(forURL: storageURL)
        test1()
        test2()
    }
    
    func test1() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func test2() {
        let uploadRef = storage.child("images/settings.png")
        let data = UIImagePNGRepresentation(#imageLiteral(resourceName: "settings"))
        _ = uploadRef.put(data!, metadata: nil, completion: { (_, error) in
            if error != nil {
                print(error!)
            } else {
                print("Upload successful!")
            }
        })
    }
    
    func test3() {
        let uploadRef = storage.child("images/settings.png")
        let data = UIImagePNGRepresentation(#imageLiteral(resourceName: "settings"))
        let metadata = FIRStorageMetadata()
        metadata.contentType = "image/png"
        _ = uploadRef.put(data!, metadata: metadata, completion: { (_, error) in
            if error != nil {
                print(error!)
            } else {
                print("Upload successful!")
            }
        })
    }
    
    func test4() {
        let downloadRef = storage.child("images/my_image.png")
        downloadRef.data(withMaxSize: 1024 * 1024) { (data, error) in
            if error != nil {
                print(error!)
            } else {
                self.imageView.image = UIImage(data: data!)
            }
        }
    }
    @IBAction func click() {
        GIDSignIn.sharedInstance().signOut()
        try? FIRAuth.auth()?.signOut()
    }
}
