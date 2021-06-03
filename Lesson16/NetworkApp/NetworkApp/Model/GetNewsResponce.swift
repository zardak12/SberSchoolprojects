//
//  GetNewsResponce.swift
//  NetworkApp
//
//  Created by OUT-Shneyderman-MY on 3/6/21.
//

import Foundation

// MARK: - Model

struct GetNewsResponce : Decodable {
  let category  : String
  let datetime  : Int
  let headline  : String
  let related   : String
  let summary   : String
  let source    : String
  let image     : String
  let url       : String
  let id        : Int
}
