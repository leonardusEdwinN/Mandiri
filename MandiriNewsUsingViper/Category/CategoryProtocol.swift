//
//  CategoryProtocol.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation
import UIKit

protocol LiveNewsListPresenterToViewProtocol: class {
    func showNews()
    func showError()
}

protocol LiveNewsListInteractorToPresenterProtocol: class {
    func liveNewsFetched()
    func liveNewsFetchedFailed()
}

protocol LiveNewsListPresentorToInteractorProtocol: class {
    var presenter: LiveNewsListInteractorToPresenterProtocol? { get set }
    var news: [LiveNewsModel]? { get }
    
    func fetchLiveNews()
}

protocol LiveNewsListViewToPresenterProtocol: class {
    var view: LiveNewsListPresenterToViewProtocol? { get set }
    var interactor: LiveNewsListPresentorToInteractorProtocol? { get set }
    var router: LiveNewsListPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getNewsListCount() -> Int?
    func getNews(index: Int) -> LiveNewsModel?
}

protocol LiveNewsListPresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}
