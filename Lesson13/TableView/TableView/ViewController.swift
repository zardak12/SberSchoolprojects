//
//  ViewController.swift
//  TableView
//
//  Created by Марк Шнейдерман on 25.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView()
    var places = [
        "Чехия",
        "Германия",
        "Австрия",
        "Нидерланды",
        "Хорватия",
        "Швейцария",
        "Франция",
        "Италия",
        "Испания"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Travel"
        self.view.addSubview(tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        //let customCell = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        tableViewConstraints()
        
    }
    
    /// tableView Constraint
    func tableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }

}

  //MARK: - UITableViewDataSource
extension ViewController:  UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        let country = places[indexPath.row]
        cell.buttonCheck.tag = indexPath.row
        cell.configure(with: country)
        return cell
    }
    
    
}

  //MARK: - UITableViewDelegate

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controller = DetailViewController()
        controller.name = places[indexPath.row]
        controller.numberOfImage = indexPath.row
        present(controller, animated: true)
    }
}
