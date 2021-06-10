//
//  ViewController.swift
//  ToBe
//
//  Created by Марк Шнейдерман on 10.06.2021.
//

import UIKit

  //MARK: - Delegate
protocol ViewControllerDelegate : AnyObject  {
    func didChangeImage(_ image : UIImage)
}

  //MARK: - View Contoller

class ViewController: UIViewController , ViewControllerDelegate {

    
      //MARK: - UI
    private lazy var saveItem : UIBarButtonItem = {
        let add = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(save))
        return add
    }()
    
    private lazy var settingItem : UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem:.edit
                                     , target: self, action: #selector(settingButton))
        
        return button
    }()
    
    private lazy var imageView : UIImageView = {
      let image = UIImageView()
      image.backgroundColor = .clear
      image.contentMode = .scaleAspectFit
      image.translatesAutoresizingMaskIntoConstraints = false
      return image
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.itemSize = CGSize(width: view.frame.width/2, height: view.frame.height/2)
        flow.scrollDirection = .horizontal
        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: flow)
        collection.backgroundColor = .clear
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        collection.dataSource = self
        collection.delegate =  self
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
     }()
    

    var currentImage : UIImage?
    
      //MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
        //MARK: - Configure UI
      
    func configure() {
        title = "Filters"
        currentImage = UIImage(named: "панда")
        imageView.image = currentImage
        navigationItem.rightBarButtonItems = [saveItem,settingItem]
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(collectionView)
        setUpConstraint()
    }
    
      //MARK: - Constraint
    
    func  setUpConstraint(){
        NSLayoutConstraint.activate([
          imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
          imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
          imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
          collectionView.topAnchor.constraint(equalTo: imageView.safeAreaLayoutGuide.bottomAnchor,constant: 100),
          collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
          collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10),
          collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -10)
        ])
    }
    
      //MARK: - DidChange Delegat
    
    func didChangeImage(_ image: UIImage) {
        imageView.image = image
    }
    
    
      //MARK: - Save Button
    
    @objc func save() {
        guard let selectedImage = imageView.image else {return}
        DataManager.shared.add(with: selectedImage)
        collectionView.reloadData()
        //UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
       //MARK: - Image Save
     
      ///Выводит информация сохранена ли фотография или произошла ошибка
     @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
         if let error = error {
             print("ERROR: \(error)")
         }
         else {
             self.showAlert("Image saved", message: "The iamge is saved into your Photo Library.")
         }
     }
     
    
     private func showAlert(_ title: String, message: String) {
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
         self.present(alert, animated: true, completion: nil)
     }
    

      //MARK: - Edit BarButton
    @objc func settingButton() {
        present(SettingViewController(delegate: self,with: currentImage ?? UIImage()), animated: true)
    }
}

  //MARK: - UICollectionViewDataSource,UICollectionViewDelegate 

extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManager.shared.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as! CollectionViewCell
        let images = DataManager.shared.images
        let image = images[indexPath.item]
        cell.configure(with : image)
        return cell
    }
}
