//
//  ListSourceInteractor.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//

import Foundation
import Moya

class ListSourceInteractor: ListSourcesInputInteractorProtocol{
    var presenter: ListSourcesOutputInteractorProtocol?
    let provider = MoyaProvider<WebService>()
    
    func getSources(page: Int, limit: Int, querySearch: String) {
        provider.request(.getNewsSources(page: page, limit: limit, query: querySearch)) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                do {
                    let data = try response.map(SourcesResponseEntity.self).sources
                    self.presenter?.interactorDidFetchSourcesList(with: .success(data ?? []))
                } catch {
                    self.presenter?.interactorDidFetchSourcesList(with: .failure(FetchError.failed))
                }
            case .failure:
                self.presenter?.interactorDidFetchSourcesList(with: .failure(FetchError.failed))
            }
        }
    }

}
