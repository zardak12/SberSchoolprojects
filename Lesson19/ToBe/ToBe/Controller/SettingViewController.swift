//
//  SettingViewController.swift
//  ToBe
//
//  Created by Марк Шнейдерман on 10.06.2021.
//

import UIKit

class SettingViewController: UIViewController {

    
    // MARK: -  Properties
    
    private var context = CIContext()
    private var currentFilter : CIFilter?
    private var currentImage : UIImage?
    private let keyEffect = CIFilter.filterNames(inCategory: kCICategoryBuiltIn)
    private var service = ServiceManager()
    weak var delegate : ViewControllerDelegate?
    
    
    //MARK: - UI
    private lazy var  slider : UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.addTarget(self, action: #selector(change), for: .valueChanged)
        return slider
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
    
    private lazy var doneButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .purple
        button.setTitle("save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Settings"
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textColor = .black
        return label
    }()
    
      //MARK: - Init
    
    init(delegate : ViewControllerDelegate,with image : UIImage) {
        self.delegate = delegate
        self.currentImage = image
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - LIFE CIRCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        startSetUp()
    }
    
    //MARK: - Configure UI
    
    func configure() {
        title = "Filters"
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(slider)
        view.addSubview(selectButton)
        view.addSubview(doneButton)
        setUpConstraint()
    }
    
    //MARK: - startSetUp
    func startSetUp() {
        currentFilter = CIFilter(name: "CISepiaTone")
    }
    
    // MARK: -  Constraint
    
    func setUpConstraint() {

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 60),
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            selectButton.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 40),
            selectButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            selectButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor,constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 40),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            doneButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor,constant: 10),
        ])
    }
    
    // MARK: - Update
    func update(with filterImage : UIImage,filter : CIFilter){
        let newImage = service.doFilter(image: filterImage , selectFilter: filter,valueIntesive : slider.value)
        currentImage = newImage
        delegate?.didChangeImage(currentImage ?? UIImage())
    }
    
    
    
    // MARK: -  Slider
    
    @objc func change() {
        update(with: currentImage ?? UIImage(),filter: currentFilter ?? CIFilter())
    }
    
    // MARK: -  Select Button
    
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
    
      //MARK: - Dismiss
    
    @objc func goBack() {
       dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - Set Filter
    
    /// Alert handler
    func setFilter(action : UIAlertAction) {
        guard currentImage != nil else {return}
        guard  let actionTitle = action.title else { return }
        currentFilter = CIFilter(name: actionTitle)
        update(with: currentImage ?? UIImage(), filter: currentFilter ?? CIFilter())
    }      
}
