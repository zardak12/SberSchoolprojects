//
//  NewsCell.swift
//  NetworkApp
//
//  Created by OUT-Shneyderman-MY on 3/6/21.
//

import UIKit

class NewCell: UITableViewCell {
  
    // MARK: - UI
    private lazy var titleLabel : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        title.font = CellConstants.fontSize
        return title
    }()
    
  // MARK: - Init
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  // MARK: -  Layout
    func layout() {
        NSLayoutConstraint.activate([
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8),
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5)
        ])
    }
    
  // MARK: - Configure
  
  func configure(with model: GetNewsResponce) {
    titleLabel.text = model.headline
  }
}
