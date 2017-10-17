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
        
        tableView.rx.modelSelected((MCPeerID, Bool).self).bind { [weak self] (model) in
            guard let index = self?.detectedPeers.value.index(where: { $0.0 == model.0 }) else { return }
            guard let `self` = self else { return }
            if !self.detectedPeers.value[index].1 {
                self.browser.invitePeer(self.detectedPeers.value[index].0, to: self.session, withContext: nil, timeout: 30)
            } else {
                let string = "disconnect"
                try? self.session.send(string.data(using: .utf8)!, toPeers: [self.detectedPeers.value[index].0], with: .reliable)
            }
        }.disposed(by: disposeBag)
        
        peer = MCPeerID(displayName: UIDevice.current.name)
        session = MCSession(peer: peer)
        browser = MCNearbyServiceBrowser(peer: peer, serviceType: "testingarea")
        advertiser = MCNearbyServiceAdvertiser(peer: peer, discoveryInfo: nil, serviceType: "testingarea")
        browser.delegate = self
        advertiser.delegate = self
        session.delegate = self
        
        advertiser.startAdvertisingPeer()
        visibleSwitch.rx.isOn.bind(onNext: {
            [weak self] on in
            if on {
                self?.advertiser.startAdvertisingPeer()
            } else {
                self?.advertiser.stopAdvertisingPeer()
            }
        }).disposed(by: disposeBag)
        
        browser.startBrowsingForPeers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func click() {
//        try? session.send(textfield.text!.data(using: .utf8)!, toPeers: session.connectedPeers, with: .reliable)
        session = nil
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
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        if session.connectedPeers.isEmpty {
            invitationHandler(true, session)
            advertiser.stopAdvertisingPeer()
        } else {
            invitationHandler(false, nil)
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        let message = String.init(data: data, encoding: .utf8)
        if message == "disconnect" {
            session.disconnect()
        } else {
            DispatchQueue.main.async {
                [weak self] in
                self?.textview.text = "\(peerID.displayName): \(message!)"
            }
        }
    }
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        guard let index = detectedPeers.value.index(where: { $0.0 == peerID }) else { return }
        switch state {
        case .connected:
            detectedPeers.value[index].1 = true
        case .notConnected:
            detectedPeers.value[index].1 = false
        case .connecting:
            print("connecting to \(peerID.displayName)")
        }
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL, withError error: Error?) {
        
    }
}
