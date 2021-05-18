//
//  GradientView.swift
//  Lesson10
//
//  Created by OUT-Shneyderman-MY on 18/5/21.
//

import UIKit

final class GradientView: UIView {

  var colors = [UIColor]() {
    didSet {
      updateAppearance()
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    gradientLayer.startPoint = .init(x: 0, y: 0)
    gradientLayer.endPoint = .init(x: 1, y: 1)
    layer.cornerRadius = 20
    
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override class var layerClass: AnyClass {
    return CAGradientLayer.self
  }

  private var gradientLayer: CAGradientLayer {
    layer as? CAGradientLayer ?? CAGradientLayer()
  }

  private func updateAppearance() {
    gradientLayer.colors = colors.map { $0.cgColor }
  }

  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    let view = super.hitTest(point, with: event)
    return view
  }
}

