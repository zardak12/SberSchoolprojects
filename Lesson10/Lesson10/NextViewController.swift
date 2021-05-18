//
//  NextViewController.swift
//  Lesson10
//
//  Created by OUT-Shneyderman-MY on 18/5/21.
//

import UIKit

class NextViewController : UIViewController {
  
    /// градиент вью который находится посередине экрана
  lazy var gradientView : GradientView =  {
    let view = GradientView(frame: .zero)
    view.colors = [.purple,.green,.brown,.orange]
    return view
  }()
    
    /// switch который меняет цвет gradientView по нажатию
    lazy var switchGradient : UISwitch = {
       let mySwitch = UISwitch()
        return mySwitch
    }()
  
    /// Label который подсказывает что нужно нажать на switch
    lazy var switchLabel : UILabel = {
        let myswitchLabel = UILabel()
        myswitchLabel.textColor = .purple
        myswitchLabel.text = "Push on Switch"
        myswitchLabel.numberOfLines = 0
        myswitchLabel.sizeToFit()
        return myswitchLabel
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        settingsNavigationContollerNext()
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor  = .yellow
    view.addSubview(gradientView)
    view.addSubview(switchGradient)
    view.addSubview(switchLabel)
    switchGradient.addTarget(self, action: #selector(didChanded), for: .valueChanged)
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    gradientView.frame = .init(x: 0, y: 0, width: 300, height: 300)
    gradientView.center = view.center
    switchLabel.translatesAutoresizingMaskIntoConstraints = false
    switchGradient.translatesAutoresizingMaskIntoConstraints = false
    /// autoLayout
    switchLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
    switchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    switchGradient.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    switchGradient.topAnchor.constraint(equalTo: switchLabel.bottomAnchor,constant: 20).isActive = true
    
  }
    //MARK: - UINavigationContoller settings
  func settingsNavigationContollerNext() {
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.yellow]
    self.navigationController?.navigationBar.barTintColor = .purple
    self.title =  "Gradient"
  }
    
      //MARK: - Метод который меняет цвета в нашем gradientView
   @objc func didChanded() {
        if switchGradient.isOn == true {
            gradientView.colors = [.orange,.blue,.brown,.cyan,.gray]
        } else {
            gradientView.colors = [.purple,.green,.brown,.orange]
        }
    }
  
  
  
}
