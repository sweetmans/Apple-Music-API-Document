//
//  MDStoreFront.swift
//
//  Created by iJSON Swift model generator on 2021/07/04.
//  Copyright © 2021. All rights reserved.
//

import Foundation

struct MDStoreFront: Decodable {
    var data: [MDStoreFrontData] = []

    enum CodingKeys: String, CodingKey {
        case data
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([MDStoreFrontData].self, forKey: .data)
    }

    static func toOption(From data: Data) -> MDStoreFront? {
        return try? JSONDecoder().decode(MDStoreFront.self, from: data)
    }
}

struct MDStoreFrontData: Decodable {
    var id: String?
    var attributes: MDStoreFrontDataAttributes?
    var href: String?
    var type: String?

    enum CodingKeys: String, CodingKey {
        case id
        case attributes
        case href
        case type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        attributes = try container.decode(MDStoreFrontDataAttributes.self, forKey: .attributes)
        href = try container.decode(String.self, forKey: .href)
        type = try container.decode(String.self, forKey: .type)
    }

    static func toOption(From data: Data) -> MDStoreFrontData? {
        return try? JSONDecoder().decode(MDStoreFrontData.self, from: data)
    }
}

struct MDStoreFrontDataAttributes: Decodable {
    var explicitContentPolicy: String?
    var supportedLanguageTags: [String] = []
    var defaultLanguageTag: String?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case explicitContentPolicy
        case supportedLanguageTags
        case defaultLanguageTag
        case name
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        explicitContentPolicy = try container.decode(String.self, forKey: .explicitContentPolicy)
        supportedLanguageTags = try container.decode([String].self, forKey: .supportedLanguageTags)
        defaultLanguageTag = try container.decode(String.self, forKey: .defaultLanguageTag)
        name = try container.decode(String.self, forKey: .name)
    }

    static func toOption(From data: Data) -> MDStoreFrontDataAttributes? {
        return try? JSONDecoder().decode(MDStoreFrontDataAttributes.self, from: data)
    }
}