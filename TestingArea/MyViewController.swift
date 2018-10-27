import UIKit
import ISHPullUp

class MyViewController: UIViewController, ISHPullUpStateDelegate, ISHPullUpSizingDelegate {
    
    @IBOutlet var pullUpHandle: ISHPullUpHandleView!
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.backgroundColor = UIColor.white.withAlphaComponent(0.7)
    }
    
    // MARK: ISHPullUpSizingDelegate
    
    func pullUpViewController(_ pullUpViewController: ISHPullUpViewController, maximumHeightForBottomViewController bottomVC: UIViewController, maximumAvailableHeight: CGFloat) -> CGFloat {
        return view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height * 0.7
    }
    
    func pullUpViewController(_ pullUpViewController: ISHPullUpViewController, minimumHeightForBottomViewController bottomVC: UIViewController) -> CGFloat {
        return pullUpHandle.height * 2
    }
    
    func pullUpViewController(_ pullUpViewController: ISHPullUpViewController, targetHeightForBottomViewController bottomVC: UIViewController, fromCurrentHeight height: CGFloat) -> CGFloat {
        return 500
    }
    
    func pullUpViewController(_ pullUpViewController: ISHPullUpViewController, update edgeInsets: UIEdgeInsets, forBottomViewController bottomVC: UIViewController) {
        // we update the scroll view's content inset
        // to properly support scrolling in the intermediate states
        textView.contentInset = edgeInsets;
    }
    
    // MARK: ISHPullUpStateDelegate
    
    func pullUpViewController(_ pullUpViewController: ISHPullUpViewController, didChangeTo state: ISHPullUpState) {
        pullUpHandle.setState(ISHPullUpHandleView.handleState(for: state), animated: true)
        
        // Hide the scrollview in the collapsed state to avoid collision
        // with the soft home button on iPhone X
        UIView.animate(withDuration: 0.25) { [weak self] in
            self?.textView.alpha = (state == .collapsed) ? 0 : 1;
        }
    }

}

