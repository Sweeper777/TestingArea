
import UIKit

class MyViewController: UIViewController {
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    override func viewDidLoad() {
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: view.subviews)
        animator.addBehavior(gravity)
        collision = UICollisionBehavior(items: view.subviews)
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        let itemBehaviour = UIDynamicItemBehavior(items: view.subviews)
        itemBehaviour.friction = 1
        itemBehaviour.elasticity = 0.7
        animator.addBehavior(itemBehaviour)
        
    }
    
}
