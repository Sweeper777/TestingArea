import UIKit

class ToolTipView: UIView {

    let tipOffset : CGFloat = 10.0

    override init(frame: CGRect) {
        super.init(frame: frame)

        print(frame)

        let mainRect = CGRect(x: bounds.minX, y: bounds.minY, width: bounds.width, height: bounds.height - tipOffset)
        let roundRectBez = UIBezierPath(roundedRect: mainRect, cornerRadius: 3.0)
        let mainShape = CAShapeLayer()
        mainShape.path = roundRectBez.cgPath
        mainShape.fillColor = UIColor.darkGray.cgColor
        self.layer.addSublayer(mainShape)

        let trianglePath = createTip(_frame: bounds)
        self.layer.insertSublayer(trianglePath, at: 0)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createTip(_frame: CGRect) -> CAShapeLayer{
        let shape = CAShapeLayer()

        let tipRect = CGRect(x: _frame.minX, y: _frame.minY, width: _frame.width, height: _frame.height - tipOffset)

        let path = UIBezierPath()
        path.move(to: CGPoint(x: tipRect.midX - 10, y: tipRect.maxY))
        path.addLine(to: CGPoint(x: tipRect.midX, y: tipRect.maxY + tipOffset))
        path.addLine(to: CGPoint(x: tipRect.midX + 10, y: tipRect.maxY))
        path.addLine(to: CGPoint(x: tipRect.midX - 10, y: tipRect.maxY))
        path.close()

        shape.path = path.cgPath
        shape.fillColor = UIColor.darkGray.cgColor

        return shape
    }
}
