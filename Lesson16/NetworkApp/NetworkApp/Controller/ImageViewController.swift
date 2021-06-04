//
//  ImageViewController.swift
//  NetworkApp
//
//  Created by OUT-Shneyderman-MY on 3/6/21.
//

import UIKit


final class  ImageViewController:  BaseViewContoller {
  
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
  
  private lazy var categoryLabel : UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.font = ImageConstants.sizeOfCategory
    return label
  }()
  
  private lazy var headlineLabel : UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.font = ImageConstants.sizeOfText
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
    title = String(model.id)
  }
  private func add() {
    view.addSubview(categoryLabel)
    view.addSubview(headlineLabel)
    view.addSubview(imageView)
  }
  
// MARK: - Layout
  private func  setLayout(){
    NSLayoutConstraint.activate([
      categoryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30),
      categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      categoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      categoryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      headlineLabel.topAnchor.constraint(equalTo: categoryLabel.topAnchor,constant: 50),
      headlineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      headlineLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      headlineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: ImageConstants.imageViewConstraint),
      imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -ImageConstants.imageViewConstraint),
      imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ImageConstants.imageViewConstraint),
      imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -ImageConstants.imageViewConstraint)
    ])
  }
  
  // MARK: - LoadData
  private func loadData() {
    networkService.loadImage(with: model) { (data) in
      if let data = data, let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self.categoryLabel.text = "Category : \(self.model.category)"
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
