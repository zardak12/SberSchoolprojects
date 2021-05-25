//
//  CustomCell.swift
//  TableView
//
//  Created by Марк Шнейдерман on 25.05.2021.
//

import UIKit

enum ButtonCondition  {
    case ready
    case notReady
}


class CustomCell: UITableViewCell {
    
    var state : ButtonCondition = .notReady
    
    
    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    lazy var buttonCheck : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.backgroundColor = .clear
        button.layer.cornerRadius = 0.5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
        button.addTarget(self, action: #selector(check), for: .touchUpInside)
        return button
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(buttonCheck)
        buttonCheck.becomeFirstResponder()
        labelConstraints()
        buttonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// AutoLayot
    func labelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func buttonConstraints() {
        buttonCheck.translatesAutoresizingMaskIntoConstraints = false
        buttonCheck.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        buttonCheck.widthAnchor.constraint(equalToConstant: 40).isActive = true
        buttonCheck.topAnchor.constraint(equalTo: self.topAnchor,constant: 5).isActive = true
        buttonCheck.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -5).isActive = true
    }
    
      //MARK: - Отмечает были мы или не были в этом месте
    @objc func check() {
        switch state {
        case .notReady:
            buttonCheck.setImage(.checkmark, for: .normal)
            state = .ready
        case .ready:
            buttonCheck.setImage(.none, for: .normal)
            state = .notReady
        }
    }
    
    func configure( with text : String) {
        label.text = text
    }

}
