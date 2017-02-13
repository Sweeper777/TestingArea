import UIKit
import SwiftyUtils
import EZSwiftExtensions
import ASToast
import YCXMenu

class MyViewController2: UIViewController {
    @IBAction func btnClicked(sender: UIButton) {
        let homeItem = YCXMenuItem("Home", image: #imageLiteral(resourceName: "home"), target: self, action: #selector(home))!
        let settingsItem = YCXMenuItem("Settings", image: #imageLiteral(resourceName: "settings"), target: self, action: #selector(settings))!
        YCXMenu.show(in: self.view, from: sender.frame, menuItems: [homeItem, settingsItem], selected: nil)
        YCXMenu.setHasShadow(true)
    }
    
    func home() {
        print("Home tapped")
    }
    
    func settings() {
        print("Settings tapped")
    }
}
