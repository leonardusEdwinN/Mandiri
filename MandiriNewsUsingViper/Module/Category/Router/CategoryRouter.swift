//
//  CategoryRouter.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation
import UIKit

class CategoryRouter: CategoryRouterProtocol{
    class func createCategoryListModule(categoryListRef: CategoryView) {
       let presenter: CategoryPresenterProtocol & CategoryOutputInteractorProtocol = CategoryPresenter()
        
        categoryListRef.presenter = presenter
        categoryListRef.presenter?.router = CategoryRouter()
        categoryListRef.presenter?.view = categoryListRef
        categoryListRef.presenter?.interactor = CategoryInteractor()
        categoryListRef.presenter?.interactor?.presenter = presenter
    }
    
    func pushToListSource(with category: String, from view: UIViewController) {
        let listSourceVC = view.storyboard?.instantiateViewController(withIdentifier: "ListSourceView") as! ListSourceView
            
        ListSourceRouter.createListSourceModule(listSourceRef: listSourceVC, category: category)
        view.navigationController?.pushViewController(listSourceVC, animated: true)
    }
    
   

}
