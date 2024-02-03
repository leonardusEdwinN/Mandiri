//
//  CategoryRouter.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation
import UIKit

typealias EntryPoint = CategoryViewControllerProtocol & UIViewController

protocol CategoryRouterProtocol{
    var entryPoint : EntryPoint? { get }
    
    static func start() -> CategoryRouterProtocol
}

class CategoryRouter: CategoryRouterProtocol{
    
    var entryPoint: EntryPoint?
    
    static func start() -> CategoryRouterProtocol {
        let router = CategoryRouter()
        
        //VIP
        // MARK:  VIEW
        var view: CategoryViewControllerProtocol = CategoryVC()
        // MARK: Interactor
        var interactor: CategoryInteractorProtocol = CategoryInteractor()
        // MARK: Presenter
        var presenter: CategoryPresenterProtocol = CategoryPresenter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entryPoint = view as? EntryPoint
        
        return router
    }
    
    
}
