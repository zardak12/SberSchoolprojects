//
//  NetworkServiceProtocol.swift
//  NetworkApp
//
//  Created by OUT-Shneyderman-MY on 3/6/21.
//

import Foundation

typealias GetNewsApiResponce = Result<[GetNewsResponce],NetworkError>


protocol NetworkServiceProtocol{
  func getNews(completion : @escaping(GetNewsApiResponce)->Void)
  func loadImage(with model : GetNewsResponce, completion : @escaping(Data?)->Void)
}
