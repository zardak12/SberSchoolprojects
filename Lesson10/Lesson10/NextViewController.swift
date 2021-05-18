//
//  NextViewController.swift
//  Lesson10
//
//  Created by OUT-Shneyderman-MY on 18/5/21.
//

import UIKit

final class NextViewController : UIViewController {
  
  lazy var gradientView : UIView =  {
    let view = GradientView()
    view.colors = [.orange,.blue,.brown,.cyan,.gray]
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor  = .yellow
    view.addSubview(gradientView)
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    gradientView.frame = .init(x: 0, y: 0, width: 300, height: 300)
    gradientView.center = view.center
  }
  
  
  
}
