//
//  ViewController.swift
//  Animation
//
//  Created by Марк Шнейдерман on 25.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var treeImageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: "дерево"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var leikaWithoutWaterImageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: "лейка"))
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var waterImageView : UIImageView = {
        let image = UIImageView()//UIImageView(image: UIImage(named: "капля"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 1
        return image
    }()
    
    lazy var listokImageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: "листочек"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var appleImageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: "яблоко"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var growButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Grow", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(grow), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(treeImageView)
        view.addSubview(growButton)
        view.addSubview(leikaWithoutWaterImageView)
        view.addSubview(waterImageView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setLayoutButton()
        setLayoutTree()
        setLayoutLeika()
        setLayoutWater()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    
    }
    
    
    func setLayoutButton() {
        NSLayoutConstraint.activate([
            growButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            growButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            growButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            growButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        
    }
    
    func setLayoutTree() {
        NSLayoutConstraint.activate([
            treeImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            treeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            treeImageView.widthAnchor.constraint(equalToConstant: 100),
            treeImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
    func setLayoutLeika() {
        NSLayoutConstraint.activate([
            leikaWithoutWaterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            leikaWithoutWaterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 30),
            leikaWithoutWaterImageView.heightAnchor.constraint(equalToConstant: 100),
            leikaWithoutWaterImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setLayoutWater() {
        NSLayoutConstraint.activate([
            waterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            waterImageView.topAnchor.constraint(equalTo: leikaWithoutWaterImageView.bottomAnchor, constant: 30),
            waterImageView.widthAnchor.constraint(equalToConstant: 40),
            waterImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    @objc func grow() {
        
        UIView.animate(withDuration: 3.0, animations: {
            self.leikaWithoutWaterImageView.transform = CGAffineTransform(rotationAngle: -.pi / 3)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            UIView.animate(withDuration: 2) {
                self.waterImageView.image = #imageLiteral(resourceName: "капля")
                self.waterImageView.transform = CGAffineTransform(translationX: 0, y: 300)
                self.waterImageView.alpha = 0
            }
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            UIView.animate(withDuration: 2) {
                self.leikaWithoutWaterImageView.alpha = 0
                self.treeImageView.transform = CGAffineTransform(scaleX: 4, y: 4)
            }
        })
    
    }

}
