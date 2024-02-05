//
//  ListSourcePresenter.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//

import Foundation
import UIKit

class ListSourcePresenter: ListSourcesPresenterProtocol{
    
    var view: ListSourcesViewProtocol?
    var interactor: ListSourcesInputInteractorProtocol?
    var router: ListSourcesRouterProtocol?
    
    var categoryNews: String?
    
    
    func viewDidLoad() {
        self.getSourcesArticle()
    }
    
    func getSourcesArticle(){
        interactor?.getSources()
    }
    func goToNewsListWithCategoryAndSource(with category: String, source: String, and countryCode: String, from view: UIViewController) {
        
    }
}


extension ListSourcePresenter: ListSourcesOutputInteractorProtocol{
    func interactorDidFetchSourcesList(with result: Result<[SourceEntity], Error>) {
        switch result{
        case .failure(let error):
            print("ERROR GET DATA :\(error.localizedDescription)")
            view?.updateWithError(with: error.localizedDescription)
        case .success(let listSources):
            view?.updateSources(with: listSources)
        }
    }
    
    
}
