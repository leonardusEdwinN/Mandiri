//
//  CategoryProtocol.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation
import UIKit



protocol CategoryPresenterProtocol: class{
    //View -> Presenter
    var view: CategoryViewProtocol? { get set }
    var interactor: CategoryInputInteractorProtocol? { get set }
    var router: CategoryRouterProtocol? { get set }
    
    func viewDidLoad()
    func goToListNews(category: String, from view: UIViewController)
}

protocol CategoryViewProtocol: class{
    // PRESENTER -> VIEW
    func showCategories(with categories: [CategoryEntity])
}

protocol CategoryInputInteractorProtocol: class{
    //Presenter -> Interactor
    var presenter : CategoryOutputInteractorProtocol? { get set }
    
    func getCategory()
}

protocol CategoryOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func interactorDidFetchCategory(with result: [CategoryEntity])
}

protocol CategoryRouterProtocol: class{
    //Presenter -> Wireframe
    func pushToListNews(with category: String,from view: UIViewController)
    
    static func createCategoryListModule(categoryListRef: CategoryView)
}
