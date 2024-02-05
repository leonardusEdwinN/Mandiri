//
//  ListNewsProtocol.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//

import Foundation
import UIKit

protocol ListNewsPresenterProtocol: class{
    //View -> Presenter
    var view: ListNewsViewProtocol? { get set }
    var interactor: ListNewsInputInteractorProtocol? { get set }
    var router: ListNewsRouterProtocol? { get set }
    
    var categoryNews: String? { get set }
    
    func viewDidLoad(categoryNews: String, countryCode: String, source: String, limit: Int, page: Int, querySearch: String)
    func goToDetailNews(url: String, titleArticle: String, from view: UIViewController)
    
    func loadMoreArticles(isSearch: Bool, querySearch: String)
    func searchArticles(querySearch: String)
}

protocol ListNewsViewProtocol: class{
    // PRESENTER -> VIEW
    func updateNews(with news: [ArticlesEntity], isSearch: Bool)
    func updateWithError(with error : String)
}

protocol ListNewsInputInteractorProtocol: class{
    //Presenter -> Interactor
    var presenter : ListNewsOutputInteractorProtocol? { get set }
    
    func getNews(category: String, countryCode: String, sourceFrom: String, limit: Int, page: Int, querySearch: String)
}

protocol ListNewsOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func interactorDidFetchNewsListWithCategory(with result: Result<[ArticlesEntity], Error>)
}

protocol ListNewsRouterProtocol: class{
    //Presenter -> Wireframe
    func pushToDetailNews(with url: String, titleArticle: String, from view: UIViewController)
    
    static func createListNewsModule(newsListRef: ListNewsView, category: String, source: String, countryCode: String)
}

