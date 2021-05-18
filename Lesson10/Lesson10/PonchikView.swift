//
//  PonchikView.swift
//  Lesson10
//
//  Created by OUT-Shneyderman-MY on 18/5/21.
//

import UIKit

  //MARK: - Наш бублик
final class PonchikView : UIView {
  
  convenience init() {
    self.init(frame: .zero)
  }
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  /// метод, который отвечает за отрисовку в данной View
  override func draw(_ rect: CGRect) {
    let half:CGFloat = min(bounds.size.width/2, bounds.size.height/2)
    
    let circlePath = UIBezierPath(arcCenter: CGPoint(x:half,y:half) ,
                                  radius: half,
                                  startAngle: 0,
                                  endAngle: .pi * 2,
                                  clockwise: true)
    let shape = CAShapeLayer()
    shape.path = circlePath.cgPath
    shape.lineWidth = half/3
    shape.fillColor = UIColor.clear.cgColor
    shape.strokeColor = UIColor.yellow.cgColor
    layer.addSublayer(shape)
    }
  }
