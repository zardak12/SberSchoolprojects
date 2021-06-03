//
//  NewsCell.swift
//  NetworkApp
//
//  Created by OUT-Shneyderman-MY on 3/6/21.
//

import UIKit

class NewCell: UITableViewCell {
  
    enum CellConstants {
        static let identifier = "newsIndetifier"
        static let leftOffset : CGFloat = 72
        static let fontSize = UIFont.systemFont(ofSize:12)
        static let addToHeight : CGFloat = 16
    }
    
    private lazy var titleLabel : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        title.font = CellConstants.fontSize
        return title
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        NSLayoutConstraint.activate([
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8),
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5)
        ])
    }
    
  
  func configure(with model: GetNewsResponce) {
    titleLabel.text = model.headline
  }
    
//    static func sizeFor(_ text : String, width : CGFloat) -> CGFloat {
//        let attributtedString = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font: CellConstants.fontSize])
//        let rect = attributtedString.boundingRect(with: CGSize(width : width - CellConstants.leftOffset,height: .greatestFiniteMagnitude),
//                                                  options: .usesLineFragmentOrigin,
//                                                  context: nil)
//        return rect.size.height + CellConstants.addToHeight
//    }
}
