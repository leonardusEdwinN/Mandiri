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
    var articleList = [ArticlesEntity]()
    var isLoading: Bool = false
    
    @IBOutlet weak var newsListTableView: UITableView!
    
    override func viewDidLoad() {
        presenter?.viewDidLoad(categoryNews : categoryNews ?? "all")
        
        newsListTableView.register(UINib.init(nibName: "ArticleListTableViewCell", bundle: .main), forCellReuseIdentifier: "articleCell")
        newsListTableView.delegate = self
        newsListTableView.dataSource = self
    }
    
    func updateNews(with news: [ArticlesEntity]) {
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
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        // need to pass your indexpath then it showing your indicator at bottom
//        tableView.addLoading(indexPath) {
//            // add your code here
//            // append Your array and reload your tableview
//            self.getNewsFromSourceName(sourceName: self.sourcesName, isNext: true)
//            tableView.stopLoading() // stop your indicator
//        }
//    }
    
    
}
