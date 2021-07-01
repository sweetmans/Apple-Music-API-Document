//
//  StoreFront.swift
//
//  Created by iJSON Swift model generator on 2021/07/01.
//  Copyright © 2021. All rights reserved.
//

import Foundation

struct StoreFrontDataAttributes: Decodable {
    var name: String?
    var explicitContentPolicy: String?
    var supportedLanguageTags: [String] = []
    var defaultLanguageTag: String?

    enum CodingKeys: String, CodingKey {
        case name
        case explicitContentPolicy
        case supportedLanguageTags
        case defaultLanguageTag
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        explicitContentPolicy = try container.decode(String.self, forKey: .explicitContentPolicy)
        supportedLanguageTags = try container.decode([String].self, forKey: .supportedLanguageTags)
        defaultLanguageTag = try container.decode(String.self, forKey: .defaultLanguageTag)
    }

    static func toOption(From data: Data) -> StoreFrontDataAttributes? {
        return try? JSONDecoder().decode(StoreFrontDataAttributes.self, from: data)
    }
}

struct StoreFront: Decodable {
    var data: [StoreFrontData] = []

    enum CodingKeys: String, CodingKey {
        case data
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([StoreFrontData].self, forKey: .data)
    }

    static func toOption(From data: Data) -> StoreFront? {
        return try? JSONDecoder().decode(StoreFront.self, from: data)
    }
}

struct StoreFrontData: Decodable {
    var href: String?
    var id: String?
    var attributes: StoreFrontDataAttributes?
    var type: String?

    enum CodingKeys: String, CodingKey {
        case href
        case id
        case attributes
        case type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        href = try container.decode(String.self, forKey: .href)
        id = try container.decode(String.self, forKey: .id)
        attributes = try container.decode(StoreFrontDataAttributes.self, forKey: .attributes)
        type = try container.decode(String.self, forKey: .type)
    }

    static func toOption(From data: Data) -> StoreFrontData? {
        return try? JSONDecoder().decode(StoreFrontData.self, from: data)
    }
}


