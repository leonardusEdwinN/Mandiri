//
//  ListNewsPresenter.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation
import UIKit

class ListNewsPresenter: ListNewsPresenterProtocol {
    weak var view: ListNewsViewProtocol?
    var interactor: ListNewsInputInteractorProtocol?
    var router: ListNewsRouterProtocol?
    
    var page: Int = 1
    var sourceFrom: String = ""
    var countryCode = ""
    
    var categoryNews: String?
    
    func viewDidLoad(categoryNews: String, countryCode: String, source: String, limit: Int, page: Int, querySearch: String) {
        self.sourceFrom = source
        self.categoryNews = categoryNews
        interactor?.getNews(category: categoryNews, countryCode: countryCode, sourceFrom: source, limit: 15, page: page, querySearch: querySearch)
    }
    
    func goToDetailNews(url: String, titleArticle: String, from view: UIViewController) {
        router?.pushToDetailNews(with: url, titleArticle: titleArticle, from: view)
    }
    
    func loadMoreArticles(isSearch: Bool, querySearch: String) {
        self.page += 1
        interactor?.getNews(category: self.categoryNews ?? "all", countryCode: "", sourceFrom: self.sourceFrom , limit: 10, page: page, querySearch: querySearch)
    }
    
    func searchArticles(querySearch: String) {
        self.page = 1
        interactor?.getNews(category: self.categoryNews ?? "all", countryCode: "", sourceFrom: self.sourceFrom , limit: 10, page: page, querySearch: querySearch)
    }
    
    
}

extension ListNewsPresenter: ListNewsOutputInteractorProtocol{
    func interactorDidFetchNewsListWithCategory(with result: Result<[ArticlesEntity], Error>) {
        switch result{
        case .failure(let error):
            print("ERROR GET DATA :\(error.localizedDescription)")
            view?.updateWithError(with: error.localizedDescription)
        case .success(let listArticles):
            view?.updateNews(with: listArticles, isSearch: page == 1)
        }
    }
    
}
