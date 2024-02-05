//
//  CategoryPresenter.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation
import UIKit

class CategoryPresenter: CategoryPresenterProtocol{
   
    var interactor: CategoryInputInteractorProtocol?
    weak var view: CategoryViewProtocol?
    var router: CategoryRouterProtocol?
    
    func viewDidLoad() {
        self.getCategoryList()
    }

    func getCategoryList() {
        interactor?.getCategory()
    }

    func goToListNews(category: String, from view: UIViewController) {
        router?.pushToListSource(with: category, from: view)
    }
}

extension CategoryPresenter: CategoryOutputInteractorProtocol {
    func interactorDidFetchCategory(with result: [CategoryEntity]) {
        view?.showCategories(with: result)
    }
}
