import UIKit
import SwiftyUtils
import RxSwift
import RealmSwift
import MultipeerConnectivity

class MyViewController2: UIViewController, MCNearbyServiceBrowserDelegate, MCNearbyServiceAdvertiserDelegate, MCSessionDelegate {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var visibleSwitch: UISwitch!
    @IBOutlet var tableView: UITableView!
    
    var detectedPeers = Variable([(MCPeerID, Bool)]())
    
    var peer: MCPeerID!
    var session: MCSession!
    var browser: MCNearbyServiceBrowser!
    var advertiser: MCNearbyServiceAdvertiser!
    
    let disposeBag = DisposeBag()
    let fontStyles: [UIFontTextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detectedPeers.asObservable().bind(to: tableView.rx.items(cellIdentifier: "cell")) {
            row, model, cell in
            cell.textLabel?.text = model.0.displayName
            cell.accessoryType = model.1 ? .checkmark : .none
        }.disposed(by: disposeBag)
        
        peer = MCPeerID(displayName: UIDevice.current.name)
        session = MCSession(peer: peer)
        browser = MCNearbyServiceBrowser(peer: peer, serviceType: "testingarea")
        advertiser = MCNearbyServiceAdvertiser(peer: peer, discoveryInfo: nil, serviceType: "testingarea")
        browser.delegate = self
        advertiser.delegate = self
        session.delegate = self
        
        advertiser.startAdvertisingPeer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func click() {
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        detectedPeers.value.append((peerID, false))
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        guard let index = detectedPeers.value.index(where: { $0.0 == peerID }) else { return }
        detectedPeers.value.remove(at: index)
    }
    
        }
    }
}
