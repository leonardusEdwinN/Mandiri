//
//  CategoryView.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation
import UIKit

class CategoryView: UIViewController, CategoryViewProtocol{

    @IBOutlet weak var categoryTableView: UITableView!
    var presenter: CategoryPresenterProtocol?
    var categoriesList = [CategoryEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryRouter.createCategoryListModule(categoryListRef: self)
        presenter?.viewDidLoad()
        categoryTableView.register(UINib.init(nibName: "CategoryListTableViewCell", bundle: .main), forCellReuseIdentifier: "categoryCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showCategories(with categories: [CategoryEntity]) {
        categoriesList = categories
        categoryTableView.reloadData()
    }
   
}


extension CategoryView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryListTableViewCell
        let row = indexPath.row
        let categoryNews = categoriesList[row]
        
        guard let title = categoryNews.categoryName,  let image = categoryNews.categoryImage else {
            return cell ?? UITableViewCell()
        }
        
        cell?.setCell(title: title, image: image)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let categoryNews = categoriesList[row].categoryName ?? "all"
        
        presenter?.goToListNews(category: categoryNews, from: self)
    }
}
