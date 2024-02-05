//
//  ListNewsRouter.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//
import Foundation
import UIKit

protocol ListNewsRouterProtocol{
}

class ListNewsRouter: ListNewsRouterProtocol{
    
//    static func start() -> ListNewsRouterProtocol {
//        let router = ListNewsRouter()
//        
//        //VIP
//        // MARK:  VIEW
//        var view: ListNewsViewController = ListNewsViewController()
//        // MARK: Interactor
//        var interactor: ListNewsInteractorProtocol = ListNewsInteractor()
//        // MARK: Presenter
//        var presenter: ListNewsPresenterProtocol = ListNewsPresenter()
//        
//        view.presenter = presenter
//        
//        interactor.presenter = presenter
//        
//        presenter.view = view
//        presenter.interactor = interactor
//        presenter.router = router
//        
//        router.entryPoint = view as? EntryPoint
//        
//        return router
//    }
    
    
    
    class func createListNewsModule(with view: ListNewsViewController, category: String) {
        let presenter = ListNewsPresenter()
        presenter.category = category
        view.presenter = presenter
        view.presenter?.view = view
        view.presenter?.router = ListNewsRouter()
    }
    
//    static func createModule(using navigationController:UINavigationController, category: String) -> ListNewsViewController{
//            
//            // Create layers
//            let router = ListNewsRouter()
//            let presenter = ListNewsPresenter()
//            let interactor = ListNewsInteractor()
//            let view = UIStoryboard(name: "ListNews", bundle: nil).instantiateViewController(withIdentifier: "ListNewsViewController") as! ListNewsViewController
//            
//            // Connect layers
//            presenter.interactor = interactor
//            presenter.router = router
//            presenter.view = view
//            view.presenter = presenter
//            interactor.presenter = presenter
////            router. = presenter
//            router.navigationController = navigationController
//            
//            return view
//        }
}
