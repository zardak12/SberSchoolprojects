//
//  ViewController.swift
//  Lesson10
//
//  Created by OUT-Shneyderman-MY on 18/5/21.
//

import UIKit

class ViewController: UIViewController {

    /// сам пончик 
    lazy var ponchik : PonchikView  = {
    let myPonchik = PonchikView()
    return myPonchik
  }()

    /// отвечает за отрисовку нашей дырки внутри бублика
  lazy var holeView : HoleView = {
    let myHole = HoleView()
    return myHole
  }()
  
    /// кнопка по нажатие которй переход на NextViewController
  lazy var button: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("BOOM", for: .normal)
    button.setTitleColor(.yellow, for: .normal)
    button.titleLabel?.textAlignment = .center
    button.addTarget(self, action: #selector(buttonTaped), for: .touchUpInside)
    return button
  }()
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        settingsNavigationContoller()
    }
    
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
    
      //MARK: - UINavigationContoller settings
    func settingsNavigationContoller() {
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.purple]
        self.navigationController?.navigationBar.barTintColor = .yellow
        self.title =  "Ponchik"
    }

      //MARK: - buttonTaped
    /// осуществляет сам переход
  @objc func buttonTaped() {
    self.navigationController?.pushViewController(NextViewController(), animated: true)
   //present(NextViewController(), animated: true)
  }

}

