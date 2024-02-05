//
//  DetailNewsPresenter.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//

import Foundation

class DetailNewsPresenter: DetailNewsPresenterProtocol{
    var view: DetailNewsViewProtocol?
    var interactor: DetailNewsInputInteractorProtocol?
    var router: DetailNewsRouterProtocol?
    
    
}

extension DetailNewsPresenter: DetailNewsOutputInteractorProtocol{
    
}
