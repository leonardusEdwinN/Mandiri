//
//  ListNewsPresenter.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation
import UIKit

class ListNewsPresenter: ListNewsPresenterProtocol {
    
    
    
    var view: ListNewsViewProtocol?
    var interactor: ListNewsInputInteractorProtocol?
    var router: ListNewsRouterProtocol?
    
    var categoryNews: String?
    
    func viewDidLoad(categoryNews: String, countryCode: String, source: String) {
        interactor?.getNews(category: categoryNews, countryCode: countryCode, sourceFrom: source)
    }
    
    func goToDetailNews(url: String, from view: UIViewController) {
        
    }
    
    
}

extension ListNewsPresenter: ListNewsOutputInteractorProtocol{
    func interactorDidFetchNewsListWithCategory(with result: Result<[ArticlesEntity], Error>) {
        switch result{
        case .failure(let error):
            print("ERROR GET DATA :\(error.localizedDescription)")
            view?.updateWithError(with: error.localizedDescription)
        case .success(let listArticles):
            view?.updateNews(with: listArticles)
        }
    }
    
}
