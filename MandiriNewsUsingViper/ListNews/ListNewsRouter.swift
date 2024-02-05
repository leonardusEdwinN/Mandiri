//
//  ListNewsRouter.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//
import Foundation
import UIKit



class ListNewsRouter: ListNewsRouterProtocol{
    func pushToDetailNews(with url: String, from view: UIViewController) {
        let webViewDetail = view.storyboard?.instantiateViewController(withIdentifier: "WebView") as! ListNewsView
//        ListNewsRouter.createFruitDetailModule(with: webViewDetail, and: url)
        view.navigationController?.pushViewController(webViewDetail, animated: true)
    }
    
    class func createListNewsModule(newsListRef: ListNewsView, category: String) {
       let presenter: ListNewsPresenterProtocol & ListNewsOutputInteractorProtocol = ListNewsPresenter()
        
        newsListRef.categoryNews = category
        
        newsListRef.presenter = presenter
        newsListRef.presenter?.router = ListNewsRouter()
        newsListRef.presenter?.view = newsListRef
        newsListRef.presenter?.interactor = ListNewsInteractor()
        newsListRef.presenter?.interactor?.presenter = presenter
    }
    
    deinit {
        print("ListNewsRouter removed")
    }
}
