////
////  WebService.swift
////  MandiriNewsUsingViper
////
////  Created by Edwin Niwarlangga on 05/02/24.
////
//import Foundation
//import Moya
//
//public enum WebService {
//    case news(page: Int, limit: Int)
//    case searchPhotos(query: String, page: Int, limit: Int)
//}
//
//extension WebService: TargetType {
//    public var baseURL: URL {
//        return URL(string: ConstantURL.urlString)!
//    }
//    
//    public var path: String {
//        switch self {
//        case .photos:
//            return "/photos"
//        case .searchPhotos:
//            return "/search/photos"
//        }
//    }
//    
//    public var method: Moya.Method {
//        switch self {
//        case .photos:
//            return .get
//        case .searchPhotos:
//            return .get
//        }
//    }
//    
//    public var sampleData: Data {
//        switch self {
//        case .photos(let page, let limit):
//            return "[{\"id\":\"xDQKvPjxtxo\",\"slug\":\"a-person-swimming-over-a-coral-reef-with-lots-of-fish-xDQKvPjxtxo\",\"description\":\"Hometokaleidoscopic-coloredcoralreefsandanabundanceofdiversemarinelife|IslandsofNEOM-NEOM,SaudiArabia\",\"urls\":{\"small\":\"https://images.unsplash.com/photo-1682687982468-4584ff11f88a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wyOTEyOTh8MXwxfGFsbHwxfHx8fHx8Mnx8MTcwNzAxOTIxNHw&ixlib=rb-4.0.3&q=80&w=400\"}}}]".dataEncoded
//        case .searchPhotos:
//            return "".dataEncoded
//        default:
//            return Data()
//        }
//    }
//    
//    public var task: Task {
//        
//        switch self {
//        case let .photos(page, limit):
//            return .requestParameters(
//                parameters: [
//                    "page": page,
//                    "per_page": limit,
//                    "client_id": ConstantAuth.client_id],
//                encoding: URLEncoding.default)
//        case let .searchPhotos(query, page, limit):
//            return .requestParameters(
//                parameters: [
//                    "query": query,
//                    "page": page,
//                    "per_page": limit,
//                    "client_id": ConstantAuth.client_id],
//                encoding: URLEncoding.default)
//        }
//    }
//    
//    //  public var task: Task {
//    //    return .requestPlain // TODO
//    //  }
//    
//    // 6
//    public var headers: [String: String]? {
//        return ["Content-Type": "application/json"]
//    }
//    
//    // 7
//    public var validationType: ValidationType {
//        return .successCodes
//    }
//}
