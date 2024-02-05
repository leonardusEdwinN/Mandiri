//
//  ListSourcePresenter.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//

import Foundation
import UIKit

class ListSourcePresenter: ListSourcesPresenterProtocol{
    weak var view: ListSourcesViewProtocol?
    var interactor: ListSourcesInputInteractorProtocol?
    var router: ListSourcesRouterProtocol?
    
    var categoryNews: String?
    var page = 1
    
    
    func viewDidLoad(querySearch: String) {
        self.getSourcesArticle(querySearch: querySearch)
    }
    
    func getSourcesArticle(querySearch: String){
        interactor?.getSources(page: page, limit: 15, querySearch: querySearch)
    }
    func goToNewsListWithCategoryAndSource(with category: String, source: String, and countryCode: String, from view: UIViewController) {
        router?.pushToArticleList(with: category, source: source, andCountryCode: countryCode, from: view)
    }
    
    func loadMoreSources(isSearch: Bool, querySearch: String) {
        page += 1
        interactor?.getSources(page: page, limit: 10, querySearch: querySearch)
       
    }
    
    func searchSources(querySearch : String){
        interactor?.getSources(page: 1, limit: 15, querySearch: querySearch)
    }
}


extension ListSourcePresenter: ListSourcesOutputInteractorProtocol{
    func interactorDidFetchSourcesList(with result: Result<[SourceEntity], Error>) {
        switch result{
        case .failure(let error):
            print("ERROR GET DATA :\(error.localizedDescription)")
            view?.updateWithError(with: error.localizedDescription)
        case .success(let listSources):
            view?.updateSources(with: listSources, isSearch : page == 1)
        }
    }
    
    
}
