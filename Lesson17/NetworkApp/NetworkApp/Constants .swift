//
//  Constants .swift
//  NetworkApp
//
//  Created by OUT-Shneyderman-MY on 3/6/21.
//

import UIKit

// MARK: - NetworkService Constants 

enum NetworkConstants {
  enum StockKey {
    static let token = "c2scd52ad3ic1qirq440"
    static let category = "general"
  }
  
  enum StockMethod {
    static let getNews = "https://finnhub.io/api/v1/news"
  }
}

// MARK: - UITableViewCell Constants

enum CellConstants {
    static let identifier = "newsIndetifier"
    static let leftOffset : CGFloat = 72
    static let fontSize = UIFont.systemFont(ofSize:12)
    static let addToHeight : CGFloat = 16
}

// MARK: - ImageCiewController Constants

enum ImageConstants {
  static let sizeOfCategory = UIFont.systemFont(ofSize:25)
  static let sizeOfText = UIFont.systemFont(ofSize:20)
  static let imageViewConstraint : CGFloat = 30
}
