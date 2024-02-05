//
//  WebService.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//
import Foundation
import Moya

public enum WebService {
    case newsListWithCategory(category: String, country: String)
    case getNewsSources
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
        case let .newsListWithCategory(category, country):
            return .requestParameters(
                parameters: [
                    "country": country,
                    "category": category,
                    "apiKey": ConstantAuth.APIKEY],
                encoding: URLEncoding.default)
        case .getNewsSources:
            return .requestParameters(
                parameters: ["apiKey": ConstantAuth.APIKEY],
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
