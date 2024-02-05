//
//  DetailNewsRouter.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//

import Foundation

class DetailNewsRouter: DetailNewsRouterProtocol{
    static func createDetailNewsModule(detailNewstRef: DetailNewsWebView, urlSourceLink: String, title: String) {
        let presenter: DetailNewsPresenterProtocol & DetailNewsOutputInteractorProtocol = DetailNewsPresenter()
         
        detailNewstRef.urlLink = urlSourceLink
        detailNewstRef.titleArticle = title
        detailNewstRef.presenter = presenter
        detailNewstRef.presenter?.router = DetailNewsRouter()
        detailNewstRef.presenter?.view = detailNewstRef
        detailNewstRef.presenter?.interactor = DetailNewsInteractor()
        detailNewstRef.presenter?.interactor?.presenter = presenter
    }
}

