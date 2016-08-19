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
        
        var section = XLFormSectionDescriptor()
        form.addFormSection(section)
        
        var row = XLFormRowDescriptor(tag: "title", rowType: XLFormRowDescriptorTypeText, title: "Title")
        row.cellConfigAtConfigure.setObject("Hello", forKey: "textField.text")
        section.addFormRow(row)
        
        self.form = form
    }
}
