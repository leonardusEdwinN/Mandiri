//
//  SourcesResponseEntity.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//

import Foundation

import Foundation
struct SourcesResponseEntity : Codable {
    let status : String?
    let sources : [SourceEntity]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case sources = "sources"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        sources = try values.decodeIfPresent([SourceEntity].self, forKey: .sources)
    }

}
