//
//  PonchikView.swift
//  Lesson10
//
//  Created by Марк Шнейдерман on 17.05.2021.
//

import UIKit

final class PonchikView : UIView {

    private var radius : CGFloat = 100
    
    override init(frame : CGRect){
        super.init(frame: frame)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func draw(_ rect: CGRect) {
        drawBublick()

    }
    
    convenience init(radius : CGFloat) {
        self.init(frame : .zero)
        self.radius = radius
    }

    func drawBublick() {
        let half:CGFloat = min( bounds.size.width/2, bounds.size.height/2)
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x:half,y:half) ,
                                      radius: radius,
                                      startAngle: 0,
                                      endAngle: .pi * 2,
                                      clockwise: true)
        let shape = CAShapeLayer()
        shape.path = circlePath.cgPath
        shape.lineWidth = half/2.5
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.blue.cgColor
        layer.addSublayer(shape)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
 
        let view = super.hitTest(point, with: event)
        return view
    }
}
