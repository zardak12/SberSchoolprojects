//
//  ViewController.swift
//  Lesson10
//
//  Created by Марк Шнейдерман on 17.05.2021.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var ponchikView : UIView = {
        let view = PonchikView(radius: 100)
        return view
    }()
    
    lazy var hole : UIView = {
       let view = PonchikView(radius: 50)
        return view
    }()
    
    lazy var buttonTap : UIButton = {
       let button = UIButton()
        button.setTitle("Boom", for: .normal)
        button.addTarget(self, action: #selector(buttonGoVC), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(ponchikView)
        view.addSubview(hole)
        view.addSubview(buttonTap)
    }
    
    override func viewWillLayoutSubviews() {
        ponchikView.frame = .init(x: 0, y: 0, width: 200, height: 200)
        ponchikView.center = view.center
        hole.center = view.center
        buttonTap.center = view.center
        buttonTap.frame = hole.frame
        
    }
    
    @objc func buttonGoVC() {
        present(NextViewController(), animated: true, completion: nil)
    }

}

