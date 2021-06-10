//
//  CollectionViewCell.swift
//  ToBe
//
//  Created by Марк Шнейдерман on 10.06.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier
    
    static let  reuseIdentifier = "ToolsCellIdentifier"
    
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(origin: .zero,
                                                  size: CGSize(width: self.bounds.width,
                                                               height: self.bounds.height)))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    
    func configure(with image : UIImage) {
        imageView.image = image
    }
}
