//
//  DetailNewsProtocol.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//
import Foundation
import UIKit

protocol DetailNewsPresenterProtocol: class{
    //View -> Presenter
    var view: DetailNewsViewProtocol? { get set }
    var interactor: DetailNewsInputInteractorProtocol? { get set }
    var router: DetailNewsRouterProtocol? { get set }
}

protocol DetailNewsViewProtocol: class{
    // PRESENTER -> VIEW
}

protocol DetailNewsInputInteractorProtocol: class{
    //Presenter -> Interactor
    var presenter : DetailNewsOutputInteractorProtocol? { get set }
}

protocol DetailNewsOutputInteractorProtocol: class {
    //Interactor -> Presenter
}

protocol DetailNewsRouterProtocol: class{
    //Presenter -> Wireframe
    static func createDetailNewsModule(detailNewstRef: DetailNewsWebView, urlSourceLink: String, title: String)
}

