//
//  Interactor.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation
import Moya

class ListNewsInteractor: ListNewsInputInteractorProtocol {
    
    let provider = MoyaProvider<WebService>()
    var presenter: ListNewsOutputInteractorProtocol?
    
    func getNews(category: String) {
        provider.request(.newsListWithCategory(category: category, country: "id")) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                do {
                    let data = try response.map(ArticleResponseEntity.self).articles
                    self.presenter?.interactorDidFetchNewsListWithCategory(with: .success(data ?? []))
                } catch {
                    self.presenter?.interactorDidFetchNewsListWithCategory(with: .failure(FetchError.failed))
                }
            case .failure:
                self.presenter?.interactorDidFetchNewsListWithCategory(with: .failure(FetchError.failed))
            }
        }
    }
    
    
}
