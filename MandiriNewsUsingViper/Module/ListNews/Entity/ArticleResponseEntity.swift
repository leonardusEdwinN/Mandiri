//
//  ArticleResponseEntity.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//

import Foundation

import Foundation
struct ArticleResponseEntity : Codable {
    let status : String?
    let totalResults : Int?
    let articles : [ArticlesEntity]?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case totalResults = "totalResults"
        case articles = "articles"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
        articles = try values.decodeIfPresent([ArticlesEntity].self, forKey: .articles)
    }

}
