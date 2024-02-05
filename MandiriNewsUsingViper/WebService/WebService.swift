//
//  WebService.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//
import Foundation
import Moya

public enum WebService {
    case newsListWithCategory(category: String, countryId: String, source: String)
    case getNewsSources(page: Int, limit: Int, query: String)
}

extension WebService: TargetType {
    public var baseURL: URL {
        return URL(string: ConstantURL.urlString)!
    }
    
    public var path: String {
        switch self {
        case .newsListWithCategory:
            return "/top-headlines"
        case .getNewsSources:
            return "/top-headlines/sources"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .newsListWithCategory, .getNewsSources:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case let .newsListWithCategory(category, countryId, source):
            return .requestParameters(
                parameters: [
                    "country": countryId,
                    "source": source,
                    "category": category,
                    "apiKey": ConstantAuth.APIKEY],
                encoding: URLEncoding.default)
        case let .getNewsSources(page, limit, query):
            return .requestParameters(
                parameters: [
                    "page": page,
                    "pageSize": limit,
                    "q": query,
                    "apiKey": ConstantAuth.APIKEY
                ],
                encoding: URLEncoding.default)
        }
    }
    
    //  public var task: Task {
    //    return .requestPlain // TODO
    //  }
    
    // 6
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    // 7
    public var validationType: ValidationType {
        return .successCodes
    }
}
