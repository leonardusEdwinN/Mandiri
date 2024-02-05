//
//  ListNewsProtocol.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//

import Foundation
import UIKit

protocol ListNewsPresenterProtocol{
    //View -> Presenter
    var view: ListNewsViewProtocol? { get set }
    var interactor: ListNewsInputInteractorProtocol? { get set }
    var router: ListNewsRouterProtocol? { get set }
    
    var categoryNews: String? { get set }
    
    func viewDidLoad(categoryNews: String, countryCode: String, source: String)
    func goToDetailNews(url: String, from view: UIViewController)
}

protocol ListNewsViewProtocol{
    // PRESENTER -> VIEW
    func updateNews(with news: [ArticlesEntity])
    func updateWithError(with error : String)
}

protocol ListNewsInputInteractorProtocol{
    //Presenter -> Interactor
    var presenter : ListNewsOutputInteractorProtocol? { get set }
    
    func getNews(category: String, countryCode: String, sourceFrom: String)
}

protocol ListNewsOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func interactorDidFetchNewsListWithCategory(with result: Result<[ArticlesEntity], Error>)
}

protocol ListNewsRouterProtocol{
    //Presenter -> Wireframe
    func pushToDetailNews(with url: String, from view: UIViewController)
    
    static func createListNewsModule(newsListRef: ListNewsView, category: String, source: String, countryCode: String)
}

