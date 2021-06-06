//
//  ImageViewController.swift
//  NetworkApp
//
//  Created by OUT-Shneyderman-MY on 3/6/21.
//

import UIKit


final class  ImageViewController:  BaseViewContoller {
  

  //MARK: - Constants
    
  private let sizeOfCategory = UIFont.systemFont(ofSize:25)
  private let sizeOfText = UIFont.systemFont(ofSize:20)
  private let imageViewConstraint : CGFloat = 30
  private let labelLeadingAndTralingAnchor : CGFloat = 20
  private let sourceLabelTopAnchor : CGFloat = 30
  private let headlineLabelTopAnchor : CGFloat = 60
    
  // MARK: - Dependencies
    
  private var networkService : NetworkServiceProtocol
  private var model : GetNewsResponce
  
  // MARK: - UI
    
  private lazy var imageView : UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.contentMode = .scaleAspectFit
    image.layer.cornerRadius = 20
    return image
  }()
  
  private lazy var sourceLabel : UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.font = sizeOfCategory
    return label
  }()
  
  private lazy var headlineLabel : UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.font = sizeOfText
    return label
  }()
  
  // MARK: - Init
  
  init(networkService : NetworkServiceProtocol, model : GetNewsResponce) {
    self.networkService = networkService
    self.model = model
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - LifeCircle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
    add()
    loadData() 
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setLayout()
  }
  
  // MARK: - configure UI
  private func configureView() {
    view.backgroundColor = .white
    title = String(model.category)
  }
  private func add() {
    view.addSubview(sourceLabel)
    view.addSubview(headlineLabel)
    view.addSubview(imageView)
  }
  
// MARK: - Layout
  private func  setLayout(){
    NSLayoutConstraint.activate([
        sourceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: sourceLabelTopAnchor),
        sourceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: labelLeadingAndTralingAnchor),
        sourceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -labelLeadingAndTralingAnchor),
        sourceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
        headlineLabel.topAnchor.constraint(equalTo: sourceLabel.topAnchor,constant: headlineLabelTopAnchor),
        headlineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: labelLeadingAndTralingAnchor),
        headlineLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -labelLeadingAndTralingAnchor),
        headlineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: imageViewConstraint),
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -imageViewConstraint),
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: imageViewConstraint),
        imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -imageViewConstraint)
    ])
  }
  
  // MARK: - LoadData
  private func loadData() {
    networkService.loadImage(with: model) { (data) in
      if let data = data, let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self.sourceLabel.text = "Source : \(self.model.source)"
            if self.model.summary != "" {
              self.headlineLabel.text = "News : \(self.model.summary)"
            }else {
              self.headlineLabel.text = "News : \(self.model.headline)"
            }
            self.imageView.image = image
            self.isLoading = false
          }
      }
    }
  }
}
