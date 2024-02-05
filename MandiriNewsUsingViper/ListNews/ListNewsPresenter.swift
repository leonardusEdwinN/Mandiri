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
    
    func viewDidLoad(categoryNews: String) {
        interactor?.getNews(category: categoryNews)
    }
    
    func goToDetailNews(url: String, from view: UIViewController) {
        
    }
    
    
}

extension ListNewsPresenter: ListNewsOutputInteractorProtocol{
    func interactorDidFetchCategory(with result: [CategoryEntity]) {
        
    }
}
