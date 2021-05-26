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
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        //image.alpha = 1
        return image
    }()
    
    lazy var listokImageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: "листочек"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var appleOneImageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: "яблоко"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 0
        return image
    }()
    
    lazy var appleTwoImageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: "яблоко"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 0
        return image
    }()
    
    lazy var appleThreeImageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: "яблоко"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 0
        return image
    }()
    
    lazy var appleFourImageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: "яблоко"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 0
        return image
    }()
    
    lazy var appleFiveImageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: "яблоко"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 0
        return image
    }()

    lazy var appleSixImageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: "яблоко"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 0
        return image
    }()
    
    lazy var appleSevenImageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: "яблоко"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 0
        return image
    }()


    
    lazy var deleteButton : UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Delete", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(deleteAll), for: .touchUpInside)
        return button
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
        view.addSubview(deleteButton)
        view.addSubview(growButton)
        view.addSubview(leikaWithoutWaterImageView)
        view.addSubview(waterImageView)
        view.addSubview(appleOneImageView)
        view.addSubview(appleTwoImageView)
        view.addSubview(appleThreeImageView)
        view.addSubview(appleFourImageView)
        view.addSubview(appleFiveImageView)
        view.addSubview(appleSixImageView)
        view.addSubview(appleSevenImageView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setLayoutButton()
        setLayoutTree()
        setLayoutLeika()
        setLayoutWater()
        setLayoutApple()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    
    }
    
    
    func setLayoutButton() {
        
        NSLayoutConstraint.activate([
            deleteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            deleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            deleteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            deleteButton.heightAnchor.constraint(equalToConstant: 40),
            deleteButton.topAnchor.constraint(equalTo: growButton.topAnchor, constant: 50)
            
            
            
        ])
        NSLayoutConstraint.activate([
            //growButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
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
    
    func setLayoutApple() {
        /// One
        NSLayoutConstraint.activate([
            appleOneImageView.heightAnchor.constraint(equalToConstant: 40),
            appleOneImageView.widthAnchor.constraint(equalToConstant: 40),
            appleOneImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 20),
            appleOneImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -125)
        ])
        
        /// Two
        NSLayoutConstraint.activate([
            appleTwoImageView.heightAnchor.constraint(equalToConstant: 40),
            appleTwoImageView.widthAnchor.constraint(equalToConstant: 40),
            appleTwoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 10),
            appleTwoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 110)
        ])
        
        /// Three
        NSLayoutConstraint.activate([
            appleThreeImageView.heightAnchor.constraint(equalToConstant: 40),
            appleThreeImageView.widthAnchor.constraint(equalToConstant: 40),
            appleThreeImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -50),
            appleThreeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 20)
        ])
        
        /// Four
        
        NSLayoutConstraint.activate([
            appleFourImageView.heightAnchor.constraint(equalToConstant: 35),
            appleFourImageView.widthAnchor.constraint(equalToConstant: 35),
            appleFourImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -100),
            appleFourImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 20)
        ])
        
        /// Five
        
        NSLayoutConstraint.activate([
            appleFiveImageView.heightAnchor.constraint(equalToConstant: 40),
            appleFiveImageView.widthAnchor.constraint(equalToConstant: 40),
            appleFiveImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -150),
            appleFiveImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -50)
        ])
        
        /// Six
        
        NSLayoutConstraint.activate([
            appleSixImageView.heightAnchor.constraint(equalToConstant: 40),
            appleSixImageView.widthAnchor.constraint(equalToConstant: 40),
            appleSixImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -110),
            appleSixImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -90)
        ])
        
        /// Seven
        
        NSLayoutConstraint.activate([
            appleSevenImageView.heightAnchor.constraint(equalToConstant: 50),
            appleSevenImageView.widthAnchor.constraint(equalToConstant: 50),
            appleSevenImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -130),
            appleSevenImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -155)
        ])


        
    }
    
    @objc func grow() {
        
        UIView.animate(withDuration: 2.0, animations: {
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            let animation = CABasicAnimation(keyPath: "opacity")
            animation.fromValue = 0
            animation.toValue = 1
            animation.duration = 1
            animation.fillMode = CAMediaTimingFillMode.forwards
            animation.isRemovedOnCompletion = false
            self.appleOneImageView.layer.add(animation, forKey: "opacity 2")
            self.appleTwoImageView.layer.add(animation, forKey: "opacity 2")
            self.appleThreeImageView.layer.add(animation, forKey: "opacity 2")
            self.appleFourImageView.layer.add(animation, forKey: "opacity 2")
            self.appleFiveImageView.layer.add(animation, forKey: "opacity 2")
            self.appleSixImageView.layer.add(animation, forKey: "opacity 2")
            self.appleSevenImageView.layer.add(animation, forKey: "opacity 2")
            
        })
    }
    
    @objc func deleteAll() {
        UIView.animate(withDuration: 3) {
            self.treeImageView.transform = .identity
            self.leikaWithoutWaterImageView.transform = .identity
            self.waterImageView.transform = .identity
            self.waterImageView.image = .none
            self.waterImageView.alpha = 1.0
            self.leikaWithoutWaterImageView.alpha = 1.0
            self.appleOneImageView.layer.removeAllAnimations()
            self.appleTwoImageView.layer.removeAllAnimations()
            self.appleThreeImageView.layer.removeAllAnimations()
            self.appleFourImageView.layer.removeAllAnimations()
            self.appleFiveImageView.layer.removeAllAnimations()
            self.appleSixImageView.layer.removeAllAnimations()
            self.appleSevenImageView.layer.removeAllAnimations()
        }
    }
    
}


