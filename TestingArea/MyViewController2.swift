import UIKit
import SwiftyUtils
import FirebaseAuth
import GoogleSignIn
import MultiSlider
import Eureka
import RichTextRow

class MyViewController2: FormViewController, GIDSignInUIDelegate {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var multiSlider: MultiSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ RichTextRow("test1") {
            row in
            row.value = "<span style=\"color: #00ff00\">Hello World</span>"
            row.cell.height = { 100 }
            }
            .onChange {
                row in
                print(row.value!)
        }
        
        form +++ ColorPickerRow("test2") {
            row in
            row.title = "Select a color"
            row.value = .green
            
        }
            .cellSetup {
                cell, row in
                let palette1 = ColorPalette(name: "Default", palette: [
        form +++ ColorRow("test3") {
            row in
            row.title = "Select a color"
            row.value = .green
        }
    }
    
    func test1() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
        
    @IBAction func click() {
        
    }
    
    
}
