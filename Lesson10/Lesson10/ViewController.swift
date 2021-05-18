//
//  ViewController.swift
//  Lesson10
//
//  Created by OUT-Shneyderman-MY on 18/5/21.
//

import UIKit

class ViewController: UIViewController {

  
  lazy var ponchik : UIView  = {
    let myPonchik = PonchikView()
    return myPonchik
  }()
  
  lazy var holeView : UIView = {
    let myHole = HoleView()
    return myHole
  }()
  
  lazy var button: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("BOOM", for: .normal)
    button.setTitleColor(.yellow, for: .normal)
    button.titleLabel?.textAlignment = .center
    button.addTarget(self, action: #selector(buttonTaped), for: .touchUpInside)
    return button
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .purple
    view.addSubview(ponchik)
    view.addSubview(holeView)
    view.addSubview(button)
  }
  
  override func viewWillLayoutSubviews() {
    ponchik.frame = .init(x: 0, y: 0, width: self.view.frame.height / 3, height: self.view.frame.height / 3)
    holeView.frame = .init(x: 0, y: 0, width: self.view.frame.height / 5, height: self.view.frame.height / 5)
    button.frame = holeView.frame
    button.center = view.center
    holeView.center = view.center
    ponchik.center = view.center
  }

  @objc func buttonTaped() {
   present(NextViewController(), animated: true)
  }

}

