//
//  FilmsApi.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
struct FilmsApi: FilmsSW, Codable{
    var title: String
    
    var director: String
    
    var releaseDate: String
    
    enum CodingKeys: String, CodingKey{
        case title
        case director
        case releaseDate = "release_date"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        director = try container.decode(String.self, forKey: .director)
        releaseDate = try container.decode(String.self, forKey: .releaseDate)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.director, forKey: .director)
        try container.encode(self.releaseDate, forKey: .releaseDate)
    }
}
