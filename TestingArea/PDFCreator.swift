import PDFKit

class PDFCreator {
    
    lazy var pageWidth : CGFloat  = {
        return 8.5 * 72.0
    }()
    
    lazy var pageHeight : CGFloat = {
        return 11 * 72.0
    }()
    
    lazy var pageRect : CGRect = {
        CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
    }()
    
    lazy var marginPoint : CGPoint = {
        return CGPoint(x: 10, y: 10)
    }()
    
    lazy var marginSize : CGSize = {
        return CGSize(width: self.marginPoint.x * 2 , height: self.marginPoint.y * 2)
    }()
    
    
    func pdfWithText(_ text: String, attributes: [NSAttributedString.Key: Any]) -> Data {
        //1
        let pdfMetaData = [
            kCGPDFContextCreator: "PDF Creator",
            kCGPDFContextAuthor: "Sweeper",
            kCGPDFContextTitle: "My PDF"
        ]
        
        //2
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        
        //3
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        
        //5
        let data = renderer.pdfData { (context) in
            
            //6
            self.addText(text, attributes: attributes, context: context)
        }
        
        return data
    }
    
    @discardableResult
    func addText(_ text : String, attributes: [NSAttributedString.Key: Any], context : UIGraphicsPDFRendererContext) -> CGFloat {
        
        // 2
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .natural
        paragraphStyle.lineBreakMode = .byWordWrapping
        
        //4
        let currentText = CFAttributedStringCreate(nil,
                                                   text as CFString,
                                                   attributes as CFDictionary)
        //5
        let framesetter = CTFramesetterCreateWithAttributedString(currentText!)
        
        //6
        var currentRange = CFRangeMake(0, 0)
        var done = false
        repeat {
            
            //7
            /* Mark the beginning of a new page.*/
            context.beginPage()
            
            //9
            /*Render the current page and update the current range to
             point to the beginning of the next page. */
            currentRange = renderPage(withTextRange: currentRange,
                                      andFramesetter: framesetter)
            
            //10
            /* If we're at the end of the text, exit the loop. */
            if currentRange.location == CFAttributedStringGetLength(currentText) {
                done = true
            }
            
        } while !done
        
        return CGFloat(currentRange.location + currentRange.length)
    }
    
    func renderPage(withTextRange currentRange: CFRange, andFramesetter framesetter: CTFramesetter?) -> CFRange {
        var currentRange = currentRange
        // Get the graphics context.
        let currentContext = UIGraphicsGetCurrentContext()
        
        // Put the text matrix into a known state. This ensures
        // that no old scaling factors are left in place.
        currentContext?.textMatrix = .identity
        
        // Create a path object to enclose the text. Use 72 point
        // margins all around the text.
        let frameRect = CGRect(x: self.marginPoint.x, y: self.marginPoint.y, width: self.pageWidth - self.marginSize.width, height: self.pageHeight - self.marginSize.height)
        let framePath = CGMutablePath()
        framePath.addRect(frameRect, transform: .identity)
        
        // Get the frame that will do the rendering.
        // The currentRange variable specifies only the starting point. The framesetter
        // lays out as much text as will fit into the frame.
        let frameRef = CTFramesetterCreateFrame(framesetter!, currentRange, framePath, nil)
        
        // Core Text draws from the bottom-left corner up, so flip
        // the current transform prior to drawing.
        currentContext?.translateBy(x: 0, y: self.pageHeight)
        currentContext?.scaleBy(x: 1.0, y: -1.0)
        
        // Draw the frame.
        CTFrameDraw(frameRef, currentContext!)
        
        // Update the current range based on what was drawn.
        currentRange = CTFrameGetVisibleStringRange(frameRef)
        currentRange.location += currentRange.length
        currentRange.length = CFIndex(0)
        
        return currentRange
    }
}
