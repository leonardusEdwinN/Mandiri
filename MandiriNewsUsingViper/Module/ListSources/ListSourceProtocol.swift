//
//  ListSourceProtocol.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//
import Foundation
import UIKit

protocol ListSourcesPresenterProtocol: class{
    //View -> Presenter
    var view: ListSourcesViewProtocol? { get set }
    var interactor: ListSourcesInputInteractorProtocol? { get set }
    var router: ListSourcesRouterProtocol? { get set }
    
    var categoryNews: String? { get set }
    
    func viewDidLoad(querySearch: String)
    func goToNewsListWithCategoryAndSource(with category: String, source: String, and countryCode: String, from view: UIViewController)
    
    func loadMoreSources(isSearch: Bool, querySearch: String)
    func searchSources(querySearch : String)
}

protocol ListSourcesViewProtocol: class{
    // PRESENTER -> VIEW
    func updateSources(with sources: [SourceEntity], isSearch: Bool)
    func updateWithError(with error : String)
}

protocol ListSourcesInputInteractorProtocol: class{
    //Presenter -> Interactor
    var presenter : ListSourcesOutputInteractorProtocol? { get set }
    
    func getSources(page: Int, limit: Int, querySearch: String)
}

protocol ListSourcesOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func interactorDidFetchSourcesList(with result: Result<[SourceEntity], Error>)
}

protocol ListSourcesRouterProtocol: class{
    //Presenter -> Wireframe
    func pushToArticleList(with category: String, source: String, andCountryCode countryCode: String, from view: UIViewController)
    
    static func createListSourceModule(listSourceRef: ListSourceView, category: String)
}

