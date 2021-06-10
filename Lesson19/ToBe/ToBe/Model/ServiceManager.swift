//
//  ServiceManager.swift
//  ToBe
//
//  Created by Марк Шнейдерман on 10.06.2021.
//

import UIKit
import CoreImage

class  ServiceManager  {
  
  
  let context = CIContext()
    
      //MARK: - doFilter
    
    /// get filter to image
  func doFilter(image :UIImage, selectFilter :  CIFilter?, valueIntesive : Float) -> UIImage {
    
    guard let inputKeys = selectFilter?.inputKeys else  {return image}
    if inputKeys.contains(kCIInputIntensityKey){
      selectFilter?.setValue(valueIntesive, forKey: kCIInputIntensityKey)
    }
    if inputKeys.contains(kCIInputRadiusKey) {
      selectFilter?.setValue(valueIntesive * 200, forKey: kCIInputRadiusKey)
    }
    if inputKeys.contains(kCIInputScaleKey) {
      selectFilter?.setValue(valueIntesive * 10 , forKey: kCIInputScaleKey)
    }
    if inputKeys.contains(kCIInputCenterKey) {
      selectFilter?.setValue(CIVector(x: image.size.width/2, y: image.size.height / 2),forKey: kCIInputCenterKey)
    }
    
    if let filter = selectFilter {
      let ciImage = CIImage(image: image)
      filter.setValue(ciImage, forKey: kCIInputImageKey)
      if let filteredImage = filter.outputImage {
        if let cgImage = context.createCGImage(filteredImage, from: filteredImage.extent){
          let realImage = UIImage(cgImage: cgImage)
          return realImage
          }
        }
      }
    return image
  }
  
}
