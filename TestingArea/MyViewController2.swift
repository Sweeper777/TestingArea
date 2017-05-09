import UIKit
import SwiftyUtils
import SwiftyJSON
import Alamofire
import FTPopOverMenu_Swift
import Eureka
import FirebaseAuth
import FirebaseStorage
import FirebaseRemoteConfig
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
    @IBOutlet var imageView: UIImageView!
    
    var storage: FIRStorageReference!
    var remoteConfig: FIRRemoteConfig!
    
    override func viewDidLoad() {
        storage = FIRStorage.storage().reference(forURL: storageURL)
        remoteConfig = FIRRemoteConfig.remoteConfig()
        remoteConfig.setDefaults(["wordOfTheDay": "Default" as NSObject])
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
    
    func test5() {
        let deleteRef = storage.child("images/settings.png")
        deleteRef.delete { (error) in
            if error != nil {
                print(error!)
            } else {
                print("Deleted successfully")
            }
        }
    }
    
    func test6() {
        let uploadRef = storage.child("texts/dummy.txt")
        let data = "Hello World".data(using: .utf8)
        let metadata = FIRStorageMetadata()
        metadata.contentType = "text/plain"
        uploadRef.put(data!, metadata: metadata) { (_, error) in
            if error != nil {
                print(error!)
            } else {
                print("Success!")
            }
        }
    }
    
    func test7() {
        let downloadRef = storage.child("texts/dummy.txt")
        downloadRef.data(withMaxSize: 1024 * 1024) { (data, error) in
            if error != nil {
                print(error!)
            } else {
                self.textview.text = String(data: data!, encoding: .utf8)
            }
        }
    }
    
    func test8() {
        let uploadRef = storage.child("texts/dummy.txt")
        let data = "Hello World".data(using: .utf8)
        let metadata = FIRStorageMetadata()
        metadata.contentType = "text/plain"
        uploadRef.put(data!, metadata: metadata) { (_, error) in
            if error != nil {
                print(error!)
            } else {
                print("First: Success!")
                let uploadRef2 = self.storage.child("texts/dummy.txt")
                let data2 = "Hello World Number 2!".data(using: .utf8)
                let metadata2 = FIRStorageMetadata()
                metadata2.contentType = "text/plain"
                uploadRef2.put(data2!, metadata: metadata2) { (_, error) in
                    if error != nil {
                        print(error!)
                    } else {
                        print("Second: Success!")
                    }
                }
            }
        }
    }
    
    func test9() {
        let wordOfTheDay = remoteConfig["wordOfTheDay"].stringValue!
        self.textview.text = "Word of the day: \(wordOfTheDay)"
    }
    
    @IBAction func click() {
        GIDSignIn.sharedInstance().signOut()
        try? FIRAuth.auth()?.signOut()
    }
}
