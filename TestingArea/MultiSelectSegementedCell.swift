import Eureka
import MultiSelectSegmentedControl


public class MultiSelectSegmentedCell: Cell<NSMutableArray>, CellType, MultiSelectSegmentedControlDelegate {
    public typealias Value = NSMutableArray
    @IBOutlet var segmentedControl: MultiSelectSegmentedControl!
    
    public override func setup() {
        super.setup()
        segmentedControl.delegate = self
    }
    
    public override func update() {
        super.update()
    }
    
    public func multiSelect(_ multiSelecSegmendedControl: MultiSelectSegmentedControl!, didChangeValue value: Bool, at index: UInt) {
        row.value = NSMutableArray(array: multiSelecSegmendedControl.selectedSegmentTitles)
        row.updateCell()
    }
}

public final class MultiSelectSegmentedRow: Row<MultiSelectSegmentedCell>, RowType {
    required public init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<MultiSelectSegmentedCell>(nibName: "MultiSelectSegmentedCell")
    }
}
