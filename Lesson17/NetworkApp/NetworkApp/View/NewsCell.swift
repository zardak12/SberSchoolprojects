//
//  NewsCell.swift
//  NetworkApp
//
//  Created by OUT-Shneyderman-MY on 3/6/21.
//

import UIKit

class NewCell: UITableViewCell {
  
    //MARK: - Identifier
    
    static let identifier = "newsIndetifier"
    
    //MARK: - Constants
    
    private let leftOffset : CGFloat = 72
    private let fontSize = UIFont.systemFont(ofSize:12)
    private let addToHeight : CGFloat = 16
    private let titleLabelTopAndBottomAnchor : CGFloat = 8
    private let titleLabelLeangdAndTrailingAnchor : CGFloat = 5
    
    // MARK: - UI
    
    private lazy var titleLabel : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        title.font =  fontSize
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
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: titleLabelTopAndBottomAnchor),
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -titleLabelTopAndBottomAnchor),
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: titleLabelLeangdAndTrailingAnchor),
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -titleLabelLeangdAndTrailingAnchor)
        ])
    }
    
  // MARK: - Configure
  
  func configure(with model: GetNewsResponce) {
    titleLabel.text = model.headline
  }
}
