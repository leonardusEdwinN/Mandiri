//
//  ListNewsRouter.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//
import Foundation
import UIKit



class ListNewsRouter: ListNewsRouterProtocol{
    func pushToDetailNews(with url: String, titleArticle: String, from view: UIViewController) {
        let webViewDetail = view.storyboard?.instantiateViewController(withIdentifier: "DetailNewsView") as! DetailNewsWebView
        DetailNewsRouter.createDetailNewsModule(detailNewstRef: webViewDetail, urlSourceLink: url, title: titleArticle)
        view.navigationController?.pushViewController(webViewDetail, animated: true)
    }
    
    class func createListNewsModule(newsListRef: ListNewsView, category: String, source: String, countryCode: String) {
       let presenter: ListNewsPresenterProtocol & ListNewsOutputInteractorProtocol = ListNewsPresenter()
        
        newsListRef.categoryNews = category
        newsListRef.sourceFrom = source
        newsListRef.countryCode = countryCode
        
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
