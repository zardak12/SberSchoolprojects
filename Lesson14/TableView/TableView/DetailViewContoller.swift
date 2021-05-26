//
//  DetailViewContoller.swift
//  TableView
//
//  Created by Марк Шнейдерман on 25.05.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var name : String?
    var numberOfImage : Int?
    
    
    /// label that show name
    
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = name
        label.sizeToFit()
        return label
    }()
    
    /// country image
    
    lazy var countryImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nameLabel)
        view.addSubview(countryImageView)
        view.backgroundColor = .white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setImageLayout()
        setLabelLayout()
    }
    
    func setLabelLayout(){
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: countryImageView.topAnchor,constant: -40),
            nameLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setImageLayout(){
        NSLayoutConstraint.activate([
            countryImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            countryImageView.heightAnchor.constraint(equalToConstant: 200),
            countryImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        /// убираем nil
        if let number = numberOfImage {
            countryImageView.image = UIImage(named: "image_\(number + 1)")
        }
    }
    
    
    
}
