import UIKit
import HFCardCollectionViewLayout

class MyViewController: UIViewController{
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        collectionView.allowsSelection = true
        let bgView = UIView()
        bgView.backgroundColor = .white
        let button = UIButton(type: .system)
        button.setTitle("Press ME", for: .normal)
        button.frame = CGRect(x: 100, y: 400, width: 200, height: 100)
        bgView.addSubview(button)
        collectionView.backgroundView = bgView
    }
}

extension MyViewController : HFCardCollectionViewLayoutDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HFCardCollectionViewCell
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        (collectionView.collectionViewLayout as! HFCardCollectionViewLayout).revealCardAt(index: indexPath.item)
    }
}
