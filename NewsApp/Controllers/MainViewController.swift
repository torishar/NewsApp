//
//  MainViewController.swift
//  NewsApp
//
//  Created by Viktoriia Sharukhina on 25.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var tableView: UITableView!
    
    let service = Service()
    var data = [Articles]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        searchNews()
        
        service.sendRequest("hedgehog") { news in
            self.data = news.articles
            //self.tableView.separatorStyle = .none
            self.tableView.reloadData()
        }
        
    }
    
}

// MARK: - TableView
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseID, for: indexPath) as? NewsCell {
            let articles = data[indexPath.row]
            cell.selectionStyle = .none
            cell.setCell(articles)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    private func setupTableView () {
        
        tableView = UITableView(frame: CGRect(x: 0, y: 120, width: self.view.bounds.width, height: self.view.bounds.height))
        self.view.addSubview(tableView)
        
        //register cell
        tableView.register(UINib(nibName: NewsCell.reuseID, bundle: nil), forCellReuseIdentifier: NewsCell.reuseID)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //indent at the bottom of the table
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
    }
    
    
}



// MARK: - Search
extension MainViewController: UITextFieldDelegate {
    
    private func searchNews() {
        
        let searchString = UISearchTextField(frame: CGRect(x: 20, y: 70, width: self.view.bounds.width - 40, height: 40))
        
        //settings view
        searchString.placeholder = "Search"
        searchString.font = .systemFont(ofSize: 14, weight: .medium)
        searchString.clearButtonMode = .whileEditing
        searchString.backgroundColor = .systemGray6
        
        self.view.addSubview(searchString)
        
        searchString.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let searchString = textField.text {
            service.sendRequest(searchString) { news in
                self.data = news.articles
                self.tableView.reloadData()
            }
            return true
        } else {
            return false
        }
    }
    
}
