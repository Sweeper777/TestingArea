import UIKit
import AVFoundation
import EZSwiftExtensions

class MyViewController: UIViewController {
    @IBOutlet var lbl: UILabel!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let player = try! AVAudioPlayer(contentsOfURL: NSBundle.mainBundle().URLForResource("beep", withExtension: "mp3", subdirectory: nil, localization: nil)!)
        player.prepareToPlay()
        
        NSTimer.runThisEvery(seconds: 1) {
            _ in
            self.lbl.hidden = !self.lbl.hidden
            player.play()
            player.prepareToPlay()
        }
    }
}
