//
//  ViewController.swift
//  NetworkApp
//
//  Created by OUT-Shneyderman-MY on 3/6/21.
//

import UIKit

final class ViewController: BaseViewContoller {
  
  // MARK: - UI
  private lazy var tableView : UITableView = {
    let tableView = UITableView()
    tableView.delegate   =  self
    tableView.dataSource =  self
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(NewCell.self, forCellReuseIdentifier: CellConstants.identifier)
    return tableView
    
  }()
  
  // MARK: - Dependencies
  
  private var networkService : NetworkServiceProtocol
  private var dataSource = [GetNewsResponce]()
  
  // MARK: - Init
  
  init(networkService : NetworkServiceProtocol) {
    self.networkService = networkService
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    loadData()
    DispatchQueue.main.async {
        self.tableView.reloadData()
    }
  }
  
  // MARK: - Private methods
  
  func configureUI() {
    title = "Market News"
    view.backgroundColor = .white
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
  
  // MARK: -  LoadData
  
  func loadData() {
    isLoading = true
    /// getNews handler
    self.networkService.getNews{ responce in
        DispatchQueue.main.async {
        switch responce{
        case .success(let data):
            self.dataSource.append(contentsOf: data)
            self.tableView.reloadData()
        case .failure(let error):
          self.showAlert(for: error)
        }
        self.isLoading = false
        }
    }
  }
  
  // MARK: -  UIAlertController
  
  private func showAlert(for error: NetworkError) {
      let alert = UIAlertController(title: "Error",
                                    message: message(for: error),
                                    preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      present(alert, animated: true)
  }
  
  // MARK: -  message
  private func message(for error: NetworkError) -> String {
      switch error {
      case .network:
          return "Упал запрос"
      case .decodable:
          return "Не смогли распарсить"
      case .unauthorize:
          return "Вы не авторизованы"
      case .unknown:
          return "????"
      case .error:
        return "Don't know"
      }
  }
  
  
}


// MARK: - UITableViewDelegate

extension ViewController : UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath,animated : true)
    let imageViewController = ImageViewController(networkService: networkService, model: dataSource[indexPath.row])
    navigationController?.pushViewController(imageViewController, animated: true)
  }
}

  // MARK: - UITableViewDataSource

extension ViewController : UITableViewDataSource {
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CellConstants.identifier) as! NewCell
    cell.configure(with: dataSource[indexPath.row])
    return cell
  }
  
  
}

