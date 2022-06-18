//
//  Line.swift
//  Dopomoha
//
//  Created by Вячеслав Гудзенко on 09.06.2022.
//

import UIKit

class Line: UIView {

    private var lineLayer:CAShapeLayer!
    private let margin:CGFloat = 20
    
    override func draw(_ rect: CGRect) {
        let color = self.tintColor.cgColor
        
        lineLayer = createLineLayer(rect: rect, color: color, lineWidth: 1)
        layer.addSublayer(lineLayer)
    }
    
    private func createLineLayer(rect:CGRect,color:CGColor,lineWidth:CGFloat) -> CAShapeLayer{
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 0 + margin, y: rect.height / 2))
        linePath.addLine(to: CGPoint(x: rect.width - margin, y: rect.height / 2))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = linePath.cgPath
        shapeLayer.lineWidth = lineWidth
        shapeLayer.strokeColor = color
        shapeLayer.fillColor = color
        shapeLayer.lineCap = .round
        return shapeLayer
    }
}
