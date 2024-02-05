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
    
    func viewDidLoad()
    func goToNewsListWithCategoryAndSource(with category: String, source: String, and countryCode: String, from view: UIViewController)
}

protocol ListSourcesViewProtocol: class{
    // PRESENTER -> VIEW
    func updateSources(with sources: [SourceEntity])
    func updateWithError(with error : String)
}

protocol ListSourcesInputInteractorProtocol: class{
    //Presenter -> Interactor
    var presenter : ListSourcesOutputInteractorProtocol? { get set }
    
    func getSources()
}

protocol ListSourcesOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func interactorDidFetchSourcesList(with result: Result<[SourceEntity], Error>)
}

protocol ListSourcesRouterProtocol: class{
    //Presenter -> Wireframe
    func pushToArticleList(with category: String, and source: String, from view: UIViewController)
    
    static func createListSourceModule(listSourceRef: ListSourceView, category: String)
}

