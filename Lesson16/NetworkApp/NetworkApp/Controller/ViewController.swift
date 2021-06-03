//
//  ViewController.swift
//  NetworkApp
//
//  Created by OUT-Shneyderman-MY on 3/6/21.
//

import UIKit

class ViewController: BaseViewContoller {
  
  private lazy var tableView : UITableView = {
    let tableView = UITableView()
    tableView.delegate   =  self
    tableView.dataSource =  self
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(NewCell.self, forCellReuseIdentifier: NewCell.identifier)
    return tableView
    
  }()
  
  private var networkService : NetworkServiceProtocol
  private var dataSource = [GetNewsResponce]()
  
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
  
  func loadData() {
    isLoading = true
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
  
    
    
    
    
    
  private func showAlert(for error: NetworkError) {
      let alert = UIAlertController(title: "Опаньки, что-то пошло не так",
                                    message: message(for: error),
                                    preferredStyle: .alert)
      present(alert, animated: true)
  }

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



extension ViewController : UITableViewDelegate {
  
}

extension ViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: NewCell.identifier) as! NewCell
    cell.configure(with: dataSource[indexPath.row])
    return cell
  }
  
  
}

