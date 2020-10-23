import UIKit
import RxSwift
import RxCocoa
import SCLAlertView
import SwiftyJSON
import PDFKit

@available(iOS 10.0, *)
class MyViewController2: UIViewController {
    @IBOutlet var textview: UITextView!
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var image: UIImageView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @objc let fontStyles: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .subheadline, .title1, .title2, .title3]
    // normal(4):       17, 16, 12, 11, 13, 17(b), 15, 28, 22, 20
    // large text(7):   23, 22, 18, 17, 19, 23(b), 21, 34, 28, 26
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
    }
    
    @IBAction private func click() {
        test5()
    }
    
    func test1() {
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = [
            kCGPDFContextCreator as String: "My App",
            kCGPDFContextAuthor as String: "Sweeper777"
          ]
        let pageRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        let data = renderer.pdfData { (context) in
            let image = UIImage(named: "example")!
            context.beginPage(withBounds: CGRect(origin: .zero, size: image.size), pageInfo: [:])
            image.draw(at: .zero)
        }
        do {
            let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("test.pdf")
            try data.write(to: url, options: .atomic)
            print("Written PDF file to \(url)")
        } catch {
            print(error)
        }
    }
    
    func test2() {
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = [
            kCGPDFContextCreator as String: "My App",
            kCGPDFContextAuthor as String: "Sweeper777"
          ]
        let pageRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        let data = renderer.pdfData { (context) in
            let images = [UIImage(named: "example")!, UIImage(named: "timer")!, UIImage(named: "thumb_25")!]
            for image in images {
                context.beginPage(withBounds: CGRect(origin: .zero, size: image.size), pageInfo: [:])
                image.draw(at: .zero)
            }
        }
        do {
            let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("test.pdf")
            try data.write(to: url, options: .atomic)
            print("Written PDF file to \(url)")
        } catch {
            print(error)
        }
    }
    
    func test3() {
        let images = [UIImage(named: "example")!, UIImage(named: "timer")!, UIImage(named: "thumb_25")!]
        let pages = images.compactMap(PDFPage.init)
        let document = PDFDocument()
        for page in pages {
            document.insert(page, at: document.pageCount)
        }
        do {
            let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("test.pdf")
            document.write(to: url)
            print("Written PDF file to \(url)")
        } catch {
            print(error)
        }
    }
    
    func test4() {
        let document = PDFDocument(url: Bundle.main.url(forResource: "test", withExtension: "pdf")!)!
        document.insert(PDFPage(image: UIImage(named: "home")!)!, at: document.pageCount)
        do {
            let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("test.pdf")
            document.write(to: url)
            print("Written PDF file to \(url)")
        } catch {
            print(error)
        }
    }
    
    func test5() {
        let document = PDFDocument(url: Bundle.main.url(forResource: "test", withExtension: "pdf")!)!
        image.image = document.page(at: 0)?.thumbnail(of: image.bounds.size, for: .artBox)
    }
}
