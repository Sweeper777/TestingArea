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
                    ColorSpec(hex: "#f4f5fb", name: "")
                    ])
                let palette2 = ColorPalette(name: "Reds", palette: [
                    ColorSpec(hex: "#ffebeb", name: ""),
                    ColorSpec(hex: "#fed1d1", name: ""),
                    ColorSpec(hex: "#fe9e9e", name: ""),
                    ColorSpec(hex: "#e4bcbc", name: ""),
                    ColorSpec(hex: "#cba7a7", name: "")
                    ])
                let palette3 = ColorPalette(name: "Yellows", palette: [
                    ColorSpec(hex: "#fbffeb", name: ""),
                    ColorSpec(hex: "#fafed1", name: ""),
                    ColorSpec(hex: "#f5fe9e", name: ""),
                    ColorSpec(hex: "#e1e4bc", name: ""),
                    ColorSpec(hex: "#c8cba7", name: "")
                    ])
                let palette4 = ColorPalette(name: "Greens", palette: [
                    ColorSpec(hex: "#ebfff0", name: ""),
                    ColorSpec(hex: "#d1fed3", name: ""),
                    ColorSpec(hex: "#9efea3", name: ""),
                    ColorSpec(hex: "#bce4be", name: ""),
                    ColorSpec(hex: "#a7cba9", name: "")
                    ])
                cell.palettes = [palette1, palette2, palette3, palette4]
        }
        
        form +++ ColorRow("test3") {
            row in
            row.title = "Select a color"
            row.value = .green
        }
        form +++ TextFloatLabelRow("test5") {
            row in
            row.title = "Hello"
            row.value = "World"
        }
    }
    
    func test1() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
        
    @IBAction func click() {
        
    }
    
    
}
