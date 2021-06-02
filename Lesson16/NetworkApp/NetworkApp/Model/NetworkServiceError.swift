//
//  NetworkServiceError.swift
//  NetworkApp
//
//  Created by Марк Шнейдерман on 01.06.2021.
//

import Foundation


enum NetworkServiceError : Error {
    case unauthorise
    case network
    case decodable
    case unknown
}
