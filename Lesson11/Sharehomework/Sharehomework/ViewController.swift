//
//  ViewController.swift
//  Sharehomework
//
//  Created by Марк Шнейдерман on 23.05.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    lazy var shareButton : UIButton = {
        let button = UIButton()
        button.setTitle("Share", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 0.5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(share), for: .touchUpInside)
        return button
    }()
    
    lazy var copyTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Нажмите copy в share"
        textField.borderStyle  = .roundedRect
        textField.delegate = self
        
        return textField
    }()
    
    let image = UIImage(named:  "spacibo")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        view.addSubview(shareButton)
        view.addSubview(copyTextField)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTextFieldLayout()
        setButtonLayout()
    }
    
      //MARK: - Layout
    
    /// textfield layout
    func setTextFieldLayout() {
        NSLayoutConstraint.activate([
            copyTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            copyTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            copyTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -100)
        ])
    }
    /// button layout
    func setButtonLayout() {
        NSLayoutConstraint.activate([
            shareButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            shareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            shareButton.topAnchor.constraint(equalTo: copyTextField.bottomAnchor, constant: 100),
        ])
    }
    
      //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.copyTextField.resignFirstResponder()
        return true
    }
    
      //MARK: - Share function
    
    @objc func share() {
        let text = copyTextField.text ?? "nil"
        let activity = ShareActivity()
        let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities:[activity])
        activityViewController.excludedActivityTypes = [
            .postToFlickr,
            .saveToCameraRoll,
            .postToVimeo,
        ]
        present(activityViewController, animated: true)
    }
}

