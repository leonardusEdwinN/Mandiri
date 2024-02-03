//
//  CategoryVC.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation
import UIKit

protocol CategoryViewControllerProtocol{
    var presenter : CategoryPresenterProtocol? { get set }
    
    func update()
}

class CategoryViewController: UIViewController, CategoryViewControllerProtocol{

    var presenter: CategoryPresenterProtocol?
    
    private let navigationView : UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 1
        view.layer.shadowOpacity = 5
        
        return view
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UINib.init(nibName: "CategoryListTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryListTableViewCell")
        
        return table
    }()
    
    
    private let label : UILabel = {
        let label = UILabel(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 50 , y:  UIScreen.main.bounds.height / 2 - 15, width: UIScreen.main.bounds.width, height: 30))
        label.textAlignment = .center
        label.isHidden = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.center = view.center
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
//        LoadingScreen.sharedInstance.showIndicator()
        handleConstraints()
    }
   
    func handleConstraints(){
        
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(navigationView)
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(label)
        label.text = "News Categories"
        
        navigationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        navigationView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        navigationView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        navigationView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        
        tableView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
    }
    
    func update() {
        print("RELOAD DATA")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
}


extension CategoryViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.categoryCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryListTableViewCell", for: indexPath) as? CategoryListTableViewCell
        let row = indexPath.row
        let categoryNews = presenter?.categories?[row]
        
        guard let title = categoryNews?.categoryName,  let image = categoryNews?.categoryImage else {
            return cell ?? UITableViewCell()
        }
        
        cell?.setCell(title: title, image: image)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let categoryNews = presenter?.categories?[row].categoryName ?? "all"
        
        presenter?.goToListNews(identifier: "performToListNewViewController", category: categoryNews)
    }
}
