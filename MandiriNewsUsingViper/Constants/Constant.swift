////
////  Constant.swift
////  MandiriNewsUsingViper
////
////  Created by Edwin Niwarlangga on 05/02/24.
////
//import Foundation
//struct Constants {
//    
//    struct Urls {
//        // MARK: Source
//        static func urlForGetSourceFromCategory(category : String, pageSize : Int, page: Int) -> URL {
//            return URL(string: "https://newsapi.org/v2/top-headlines/sources?apiKey=\(Constants.API_KEYS)&category=\(category.escaped())")!
//        }
//        
//        
//        // MARK: ARTICLES
//        static func urlForGetNewsFromSourceName(sourceKeyword: String, pageSize : Int, page: Int) -> URL {
////            print("https://newsapi.org/v2/top-headlines?sources=\(sourceKeyword.escaped())&apiKey=\(Constants.API_KEYS)&page=\(page)&pageSize=\(pageSize)")
//            return URL(string: "https://newsapi.org/v2/top-headlines?sources=\(sourceKeyword.escaped())&apiKey=\(Constants.API_KEYS)&page=\(page)&pageSize=\(pageSize)")!
//        }
//        
//        static func urlForGetNewsFromKeyword(keyword: String, pageSize : Int, page: Int) -> URL {
//            return URL(string: "https://newsapi.org/v2/top-headlines?apiKey=\(Constants.API_KEYS)&q=\(keyword.escaped())&pageSize=\(pageSize)&page=\(page)")!
//        }
//        
//        static func webViewDefaultValue() -> URL {
//            
//            return URL(string: "https://newsapi.org/")!
//        }
//        
//    }
//    static let API_KEYS = "6447817f8d9c44d2b93bed6580d3f848"
//    
//    
//}
