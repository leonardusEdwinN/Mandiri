//
//  ListNewsView.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation
import UIKit

class ListNewsView: UIViewController, ListNewsViewProtocol{
   
    var presenter: ListNewsPresenterProtocol?
    var categoryNews: String?
    var sourceFrom: String?
    var countryCode: String?
    var articleList = [ArticlesEntity]()
    var isLoading: Bool = false
    
    @IBOutlet weak var articleTextField: UITextField!
    @IBOutlet weak var newsListTableView: UITableView!
    
    override func viewDidLoad() {
        DispatchQueue.main.async {
            LoadingScreen.sharedInstance.showIndicator()
            self.isLoading = true
        }
        
        presenter?.viewDidLoad(categoryNews : categoryNews ?? "all", countryCode: countryCode ?? "", source: sourceFrom ?? "", limit: 15, page: 1, querySearch: articleTextField.text ?? "")
        
        newsListTableView.register(UINib.init(nibName: "ArticleListTableViewCell", bundle: .main), forCellReuseIdentifier: "articleCell")
        newsListTableView.delegate = self
        newsListTableView.dataSource = self
        
        articleTextField.delegate = self
    }
    
    func updateNews(with news: [ArticlesEntity], isSearch: Bool) {
        if isSearch {
            articleList = []
        }
        
        if news.count > 0 {
            news.forEach{ article in
                articleList.append(article)
            }
        } else {
            articleList = news
        }
        
        DispatchQueue.main.async {
            LoadingScreen.sharedInstance.hideIndicator()
            self.isLoading = false
            self.newsListTableView.reloadData()
            self.newsListTableView.isHidden = false
            
        }
    }
    
    func updateWithError(with error: String) {
        DispatchQueue.main.async {
//            self.label.text = error
            LoadingScreen.sharedInstance.hideIndicator()
            self.newsListTableView.isHidden = true
//            self.label.isHidden = false
        }
    }
    
    
}


extension ListNewsView: UITableViewDelegate{}

extension ListNewsView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as? ArticleListTableViewCell
        let row = indexPath.row
        let article = articleList[row]
        
        cell?.setCell(title: article.title ?? "", createdAt: article.publishedAt ?? "", author: article.author ?? "", description: article.description ?? "")
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let article = articleList[row]
        
        presenter?.goToDetailNews(url: article.url ?? "", titleArticle: article.title ?? "", from: self)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let getCountArticle = articleList.count
        
        if indexPath.row == getCountArticle - 2 && !isLoading && getCountArticle >= 10{
            isLoading = true
            LoadingScreen.sharedInstance.showIndicator()
            guard let searchText = articleTextField.text else {return}
            presenter?.loadMoreArticles(isSearch: searchText == "" ? false : true, querySearch: searchText)
            
        }
        
    }
    
    
}


extension ListNewsView : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.isLoading = true
        LoadingScreen.sharedInstance.showIndicator()
        
        guard let searchText = textField.text else { return false}
        presenter?.searchArticles(querySearch: searchText)
        
        return true
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ListSourceView.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
