//
//  Constants.swift
//  ToBe
//
//  Created by Марк Шнейдерман on 10.06.2021.
//

import Foundation

// MARK: -  Filter Type

enum FilterType : String {
  case Bump = "CIBumpDistortion"
  case Gaus = "CIGaussianBlur"
  case Pixel = "CIPixellate"
  case Sepia = "CISepiaTone"
  case Sharp = "CIUnsharpMask"
  case Vignette = "CIVignette"
}
