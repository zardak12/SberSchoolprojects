//
//  NetworkService.swift
//  NetworkApp
//
//  Created by OUT-Shneyderman-MY on 3/6/21.
//

import Foundation

final class NetworkService : NetworkServiceProtocol   {
  private let session : URLSession = .shared
  private let decoder = JSONDecoder()
  
  func getNews(completion: @escaping (GetNewsApiResponce) -> Void) {
    var components = URLComponents(string: Constants.StockMethod.getNews)
    components?.queryItems = [
      URLQueryItem(name: "category", value: Constants.StockKey.category),
      URLQueryItem(name: "token", value: Constants.StockKey.token)
    ]
    guard let url = components?.url  else {completion(.failure(.unknown)); return }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    session.dataTask(with: request) { (myData, myResponce, error) in
      do {
        let data = try self.httpResponse(data: myData, response: myResponce)
        let response = try self.decoder.decode([GetNewsResponce].self, from: data)
        completion(.success(response))
      } catch let error as NetworkError {
        completion(.failure(error))
      } catch {
        completion(.failure(.unknown))
      }
    }.resume()
  }
  
  func loadImage(with imageUrl: String, completion: @escaping (Data?) -> Void) {
    
  }
  
  private func httpResponse(data: Data?, response: URLResponse?) throws -> Data {
      guard let httpResponse = response as? HTTPURLResponse,
            (200..<300).contains(httpResponse.statusCode),
            let data = data else {
          throw NetworkError.network
      }
      return data
  }
  
}
