//
//  BaseViewController.swift
//  NetworkApp
//
//  Created by OUT-Shneyderman-MY on 3/6/21.
//

import UIKit

class BaseViewContoller : UIViewController {
  
  // MARK: - Child
  private let spinner = SpinnerViewController()
  
  // MARK: - On/Off Spinner 
  var isLoading = false {
    didSet {
      guard oldValue != isLoading else { return }
        showSpinner(isShown : isLoading)
    }
  }
    
    // MARK: - show Spinner
  
    private func showSpinner(isShown: Bool) {
        if isShown {
            addChild(spinner)
            spinner.view.frame = view.frame
            view.addSubview(spinner.view)
            spinner.didMove(toParent: self)
        } else {
            spinner.willMove(toParent: nil)
            spinner.view.removeFromSuperview()
            spinner.removeFromParent()
        }
    }
    
  }
