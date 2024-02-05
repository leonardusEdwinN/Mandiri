//
//  CategoryRouter.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation
import UIKit

class CategoryRouter: CategoryRouterProtocol{
    var navigationController: UINavigationController?
    
    class func createCategoryListModule(categoryListRef: CategoryView) {
       let presenter: CategoryPresenterProtocol & CategoryOutputInteractorProtocol = CategoryPresenter()
        
        categoryListRef.presenter = presenter
        categoryListRef.presenter?.router = CategoryRouter()
        categoryListRef.presenter?.view = categoryListRef
        categoryListRef.presenter?.interactor = CategoryInteractor()
        categoryListRef.presenter?.interactor?.presenter = presenter
    }
    
    func pushToListNews(with category: String,from view: UIViewController) {
        let listNewsViewController = view.storyboard?.instantiateViewController(withIdentifier: "ListNewsViewController") as! ListNewsViewController
            
        ListNewsRouter.createListNewsModule(with: listNewsViewController, category: category)
        view.navigationController?.pushViewController(listNewsViewController, animated: true)
    }

}
