//
//  CategoryPresenter.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation

protocol CategoryPresenterProtocol{
    var view: CategoryViewControllerProtocol? { get set }
    var interactor: CategoryInteractorProtocol? { get set }
    var router: CategoryRouterProtocol? { get set }
    var categories: [CategoryEntity]? { get set }
    var categoryCount: Int { get }
    
    func interactorDidFetchCategory(with result: [CategoryEntity])
    
    
}

class CategoryPresenter: CategoryPresenterProtocol{
    var categories: [CategoryEntity]?
    var categoryCount: Int {
        return categories?.count ?? 0
    }
    
    var view: CategoryViewControllerProtocol?
    
    var interactor: CategoryInteractorProtocol? {
        didSet{
            interactor?.getCategory()
        }
    }
    
    var router: CategoryRouterProtocol?
    
    func interactorDidFetchCategory(with result: [CategoryEntity]) {
        categories = result
        view?.update()
    }
    
    
    
    
}
