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
