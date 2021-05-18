//
//  HoleView.swift
//  Lesson10
//
//  Created by OUT-Shneyderman-MY on 18/5/21.
//

import UIKit

final class HoleView : UIView {
  
  convenience init(diameter: CGFloat) {
    self.init(frame: .zero)
  }
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func draw(_ rect: CGRect) {
    let half:CGFloat = min(bounds.size.width/2, bounds.size.height/2)
    let circlePath = UIBezierPath(arcCenter: CGPoint(x:half,y:half),
                                  radius: half,
                                  startAngle: 0,
                                  endAngle: .pi * 2,
                                  clockwise: true)
    let shape = CAShapeLayer()
    shape.path = circlePath.cgPath
    shape.lineWidth = 0
    shape.fillColor = UIColor.clear.cgColor
    shape.strokeColor = UIColor.blue.cgColor
    layer.addSublayer(shape)
  }
  
  
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if view === self {
            return nil
        }
        return view
    }
}
