import UIKit
import SwiftyUtils
import EZSwiftExtensions
import ASToast
import YCXMenu

class MyViewController2: UIViewController {
    @IBAction func btnClicked(sender: UIButton) {
        let homeItem = YCXMenuItem("Home", image: #imageLiteral(resourceName: "home"), target: self, action: #selector(home))!
        let settingsItem = YCXMenuItem("Settings", image: #imageLiteral(resourceName: "settings"), target: self, action: #selector(settings))!
        YCXMenu.show(in: self.view, from: sender.frame, menuItems: [homeItem, settingsItem], selected: { print("\($0) \($1)") })
        YCXMenu.setHasShadow(true)
        YCXMenu.setTintColor(UIColor(hex: "5abb5a"))
        YCXMenu.setSelectedColor(UIColor(hex: "3b7b3b"))
    }
    
    func home() {
        print("Home tapped")
    }
    
    func settings() {
        print("Settings tapped")
    }
    
    @IBAction func changed() {
        print("changed")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
