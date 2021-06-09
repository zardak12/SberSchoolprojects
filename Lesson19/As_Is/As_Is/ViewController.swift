//
//  ViewController.swift
//  As_Is
//
//  Created by OUT-Shneyderman-MY on 8/6/21.
//

import UIKit
import CoreImage

final class ViewController: UIViewController {
  
  private var context = CIContext()
  private var currentFilter : CIFilter?
  private var currentImage : UIImage?
  private let keyEffect = CIFilter.filterNames(inCategory: kCICategoryBuiltIn)
  
  // MARK: -  Properties
  
  private lazy var  slider : UISlider = {
    let slider = UISlider()
    slider.translatesAutoresizingMaskIntoConstraints = false
    slider.minimumValue = 0
    slider.maximumValue = 1
    slider.addTarget(self, action: #selector(change), for: .valueChanged)
    return slider
  }()
  
  private lazy var imageView : UIImageView = {
    let image = UIImageView()
    image.backgroundColor = .clear
    image.contentMode = .scaleAspectFit
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  
  private lazy var selectButton : UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .purple
    button.setTitle("select", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(choose), for: .touchUpInside)
    button.layer.cornerRadius = 10
    return button
  }()
  
  private lazy var saveButton : UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .purple
    button.setTitle("save", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(save), for: .touchUpInside)
    button.layer.cornerRadius = 10
    return button
  }()
  
  private lazy var labelSelector : UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Интенсивность"
    label.textColor = .black
    return label
  }()
  
  private lazy var imagePicker : UIImagePickerController = {
    let imagePicker =  UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.allowsEditing = true
    return imagePicker
  }()
  
  private lazy var addItem : UIBarButtonItem = {
      let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
      return add
  }()
  
  // MARK: - LIFE CIRCLE

  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    startSetUp()
  }
  
  func configure() {
    title = "Filters"
    self.navigationItem.rightBarButtonItem = addItem
    view.backgroundColor = .white
    view.addSubview(imageView)
    view.addSubview(labelSelector)
    view.addSubview(slider)
    view.addSubview(selectButton)
    view.addSubview(saveButton)
    setUpConstraint()
  }
  
  func startSetUp() {
    currentImage = UIImage(named: "панда")
    currentFilter = CIFilter(name: "CISepiaTone")
    imageView.image = currentImage
  }
  
  // MARK: -  Constraint
  
  func setUpConstraint() {
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
    ])
    
    NSLayoutConstraint.activate([
      labelSelector.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
      labelSelector.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      labelSelector.trailingAnchor.constraint(equalTo: slider.leadingAnchor, constant: -10)
    ])
    
    NSLayoutConstraint.activate([
      slider.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
      slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
    ])
    
    NSLayoutConstraint.activate([
      selectButton.topAnchor.constraint(equalTo: labelSelector.bottomAnchor, constant: 20),
      selectButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      selectButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor,constant: -10),
      selectButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
    ])
    
    NSLayoutConstraint.activate([
      saveButton.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 20),
      saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
      saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor,constant: 10),
      saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
    ])
  }
  
  // MARK: - Update
  func update(with filterImage : UIImage,filter : CIFilter){
  
    let newImage = ServiceManager().doFilter(image: filterImage , selectFilter: filter,valueIntesive : slider.value)
    imageView.image = newImage

  }
  
  
  
  // MARK: -  Slider
  
  @objc func change() {
    update(with: currentImage ?? UIImage(),filter: currentFilter ?? CIFilter())
  }
  
  // MARK: -  Select Buttom
  
  @objc func choose(_ sender: UIButton) {
    let alert = UIAlertController(title: "Choose filter", message: "Please Select an filter", preferredStyle: .actionSheet)
    alert.addAction(UIAlertAction(title: FilterType.Bump.rawValue, style: .default, handler: setFilter))
    alert.addAction(UIAlertAction(title: FilterType.Gaus.rawValue, style: .default, handler: setFilter))
    alert.addAction(UIAlertAction(title: FilterType.Pixel.rawValue, style: .default, handler: setFilter))
    alert.addAction(UIAlertAction(title: FilterType.Sepia.rawValue, style: .default, handler: setFilter))
    alert.addAction(UIAlertAction(title: FilterType.Sharp.rawValue, style: .default, handler: setFilter))
    alert.addAction(UIAlertAction(title: FilterType.Vignette.rawValue, style: .default, handler: setFilter))
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    self.present(alert, animated: true, completion: nil)
    if let popoverContoller = alert.popoverPresentationController {
      popoverContoller.sourceView = sender
      popoverContoller.sourceRect = sender.bounds
    }
    
}
  func setFilter(action : UIAlertAction) {
    guard currentImage != nil else {return}
    guard  let actionTitle = action.title else { return }
    currentFilter = CIFilter(name: actionTitle)
    update(with: currentImage ?? UIImage(), filter: currentFilter ?? CIFilter())
  }
  
  
  // MARK: -  Save
  
  @objc func save() {
    currentFilter = nil
  }
  
  @objc func addTapped() {
    guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
        return
    }
    present(imagePicker, animated: true, completion: nil)
  }
}


extension ViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let image = info[.editedImage] as? UIImage
    dismiss(animated: true, completion: nil)
    currentImage = image
    update(with: image ?? UIImage(),filter: currentFilter ?? CIFilter())
  }
}
