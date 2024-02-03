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
    var navigationController: UINavigationController? { get }
    
    static func start() -> CategoryRouterProtocol
    
    func popBack()
    func performSegue(with identifier:String, withCategory category: String)
}

class CategoryRouter: CategoryRouterProtocol{
    var navigationController: UINavigationController?
    var entryPoint: EntryPoint?
    
    static func start() -> CategoryRouterProtocol {
        let router = CategoryRouter()
        
        //VIP
        // MARK:  VIEW
        var view: CategoryViewControllerProtocol = CategoryViewController()
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
    
    
    func popBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func performSegue(with identifier: String, withCategory category: String) {
        let router = CategoryRouter.start()
        let initialVC = router.entryPoint
        
        initialVC?.navigationController?.visibleViewController?.performSegue(withIdentifier: identifier, sender: ["category": category])
    }
}
