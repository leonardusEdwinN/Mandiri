//
//  Interactor.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation
protocol ListNewsInteractorProtocol {
    var presenter : ListNewsPresenterProtocol? { get set }
    var news: [String]? { get }
    
    func getNews(category: String)
}

class ListNewsInteractor: ListNewsInteractorProtocol {
    var presenter: ListNewsPresenterProtocol?
    
    var news: [String]?
    
    func getNews(category: String) {
        
    }
    
}
