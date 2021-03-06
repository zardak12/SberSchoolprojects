//
//  Constants.swift
//  As_Is
//
//  Created by OUT-Shneyderman-MY on 9/6/21.
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
