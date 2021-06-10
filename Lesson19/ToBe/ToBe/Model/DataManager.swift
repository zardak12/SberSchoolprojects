//
//  DataManager.swift
//  ToBe
//
//  Created by Марк Шнейдерман on 10.06.2021.
//

import UIKit


class  DataManager  {
    
      //MARK: - Singelton
    
 static let shared = DataManager()
  
    //MARK: - Properties
  
  var images = [UIImage]()
  
    //MARK: - Add
  
  func add(with image : UIImage) {
      images.append(image)
  }
    
}
