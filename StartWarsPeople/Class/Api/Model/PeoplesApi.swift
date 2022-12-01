//
//  PeoplesApi.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
struct PeoplesApi: PeoplesSW, Codable{
    var name: String
    
    enum CodingKeys: String, CodingKey{
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
