import UIKit
import EZSwiftExtensions
import XLForm

class MyViewController: XLFormViewController {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initializeForm()
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.initializeForm()
    }
    
    func initializeForm() {
        let form = XLFormDescriptor(title: "Add Event")
        
        let section = XLFormSectionDescriptor.formSectionWithTitle("My Section")
        form.addFormSection(section)
        
        let row = XLFormRowDescriptor(tag: "picker", rowType: XLFormRowDescriptorTypeSelectorPickerViewInline, title: "Some Text")
        row.selectorOptions = ["Mandarin", "Cantonese", "English", "Japanese"]
        row.value = "Mandarin"
        section.addFormRow(row)
        
        self.form = form
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        print(form.formValues())
    }
}
