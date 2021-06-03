//
//  NewsCell.swift
//  NetworkApp
//
//  Created by OUT-Shneyderman-MY on 3/6/21.
//

import UIKit

class NewCell: UITableViewCell {
  
  static let identifier = "newsIndetifier"
  
  
  func configure(with model: GetNewsResponce) {
    textLabel?.text = model.headline
  }
}
