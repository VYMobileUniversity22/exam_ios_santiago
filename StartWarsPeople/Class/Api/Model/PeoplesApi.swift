//
//  PeoplesApi.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
struct PeoplesApi: PeoplesSW, Codable {
    var name: String
    var birthYear: String
    var gender: String
    var films: [String]

    enum CodingKeys: String, CodingKey {
        case name
        case birthYear = "birth_year"
        case gender
        case films
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        birthYear = try container.decode(String.self, forKey: .birthYear)
        gender = try container.decode(String.self, forKey: .gender)
        films = try container.decode([String].self, forKey: .films)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(birthYear, forKey: .birthYear)
        try container.encode(gender, forKey: .gender)
        try container.encode(films, forKey: .films)
    }
}
