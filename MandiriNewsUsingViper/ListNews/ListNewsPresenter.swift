//
//  ListNewsPresenter.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation

protocol ListNewsPresenterProtocol{
    var view: ListNewsViewControllerProtocol? { get set }
    var interactor: ListNewsInteractorProtocol? { get set }
    var router: ListNewsRouterProtocol? { get set }
    var news: [String]? { get set }
//    var categoryCount: Int { get }
    
    func interactorDidFetchNewsWithCategory(with result: [String])
    
    func goToListNews(identifier:String, category: String)
    
}

class ListNewsPresenter: ListNewsPresenterProtocol {
    var view: ListNewsViewControllerProtocol?
    
    var interactor: ListNewsInteractorProtocol?
    
    var router: ListNewsRouterProtocol?
    
    var news: [String]?
    
    var category: String? {
        didSet{
//            interactor.nanti moya
        }
    }
    
//    var categoryCount: Int
    
    func interactorDidFetchNewsWithCategory(with result: [String]) {
        news = result
        view?.updateNews()
    }
    
    func goToListNews(identifier: String, category: String) {
        
    }
    
    
}
