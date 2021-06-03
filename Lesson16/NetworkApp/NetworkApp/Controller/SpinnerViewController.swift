//
//  SpinnerViewController.swift
//  NetworkApp
//
//  Created by OUT-Shneyderman-MY on 3/6/21.
//

import UIKit

class SpinnerViewController : UIViewController {
  
  // MARK: -Spinner
  
  private lazy var  spiner : UIActivityIndicatorView  = {
    let spinner = UIActivityIndicatorView(style: .large)
    spinner.translatesAutoresizingMaskIntoConstraints = false
    spinner.startAnimating()
    return spinner
  }()
  
  override func loadView() {
    view = UIView()
    view.backgroundColor = .white
    view.addSubview(spiner)
    spinnerLayout()
  }
  
  // MARK: -Layout
  
  func spinnerLayout() {
    NSLayoutConstraint.activate([
      spiner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      spiner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
  
}
