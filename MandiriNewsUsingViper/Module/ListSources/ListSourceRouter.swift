//
//  ListSourceRouter.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//

import Foundation
import UIKit

class ListSourceRouter: ListSourcesRouterProtocol{
    func pushToArticleList(with category: String, source: String, andCountryCode countryCode: String, from view: UIViewController) {
        let listNewsViewController = view.storyboard?.instantiateViewController(withIdentifier: "ListNewsView") as! ListNewsView
            
        ListNewsRouter.createListNewsModule(newsListRef: listNewsViewController, category: category, source: source, countryCode: countryCode)
        view.navigationController?.pushViewController(listNewsViewController, animated: true)
    }
    
    static func createListSourceModule(listSourceRef: ListSourceView, category: String) {
        let presenter: ListSourcesPresenterProtocol & ListSourcesOutputInteractorProtocol = ListSourcePresenter()
         
        listSourceRef.categoryNews = category
        listSourceRef.presenter = presenter
        listSourceRef.presenter?.router = ListSourceRouter()
        listSourceRef.presenter?.view = listSourceRef
        listSourceRef.presenter?.interactor = ListSourceInteractor()
        listSourceRef.presenter?.interactor?.presenter = presenter
    }
    
}
