//
//  FilmsResponseApi.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
struct FilmsResponseApi: FilmsResponse, Codable {
    var results: [FilmsSW] { castResults }

    private let castResults: [FilmsApi]

    enum CodingKeys: String, CodingKey {
        case results
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        castResults = try container.decode([FilmsApi].self, forKey: .results)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(castResults, forKey: .results)
    }
}
