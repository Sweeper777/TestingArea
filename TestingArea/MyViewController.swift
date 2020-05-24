import UIKit
import Eureka
import SplitRow
import SCLAlertView

class MyViewController: FormViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ MultivaluedSection(
            multivaluedOptions: [.Insert, .Delete]) {
            $0.addButtonProvider = { section in
                return ButtonRow(){
                    $0.title = "Add"
                }
            }
            $0.multivaluedRowToInsertAt = { index in
                return SplitRow<MyRow,TextRow>(){
                    $0.rowLeft = MyRow(){
                        $0.title = ""
                    }

                    $0.rowRight = TextRow(){
                        $0.title = "Hello"
                    }
                    
                    $0.rowLeftPercentage = 0.5
                    

                }
            }
            $0 <<< SplitRow<MyRow,TextRow>(){
                $0.rowLeft = MyRow(){
                    $0.title = ""
                }

                $0.rowRight = TextRow(){
                    $0.title = "Hello"
                }
                
                $0.rowLeftPercentage = 0.5
                

            }
        }
    }
}

final class MyRow: SelectorRow<AlertSelectorCell<Int>>, RowType {
    public required init(tag: String?) {
        super.init(tag: tag)
        presentationMode = .presentModally(controllerProvider: .callback(builder: { () -> SelectorViewController<SelectorRow<AlertSelectorCell<Int>>> in
            let vc = MyRowVC()
            vc.modalPresentationStyle = .overCurrentContext
            return vc
        }),
           onDismiss: { (vc) in
            vc.dismiss(animated: true, completion: nil)
        })
        displayValueFor = {
            x in
            return "X"
        }
    }
}

class MyRowVC: SelectorViewController<SelectorRow<AlertSelectorCell<Int>>> {
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        onDismissCallback!(self)
        row.deselect(animated: true)
        row.updateCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {

    }
}
