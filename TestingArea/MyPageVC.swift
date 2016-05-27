import UIKit

class MyPageVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    override func viewDidLoad() {
        dataSource = self
        delegate = self
        
        setViewControllers([sourceVCs.first!], direction: .Forward, animated: true, completion: nil)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return sourceVCs.count
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let index = sourceVCs.indexOf(viewController) else { return nil }
        guard index + 1 < sourceVCs.endIndex else { return nil }
        return sourceVCs[index + 1]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let index = sourceVCs.indexOf(viewController) else { return nil }
        guard index - 1 > -1 else { return nil }
        return sourceVCs[index - 1]
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    lazy var sourceVCs: [UIViewController] = {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        return [storyBoard.instantiateViewControllerWithIdentifier("first"),
        storyBoard.instantiateViewControllerWithIdentifier("second"),
        storyBoard.instantiateViewControllerWithIdentifier("third")]
    }()
}
