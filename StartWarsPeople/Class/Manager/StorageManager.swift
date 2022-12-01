//
//  StorageManager.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation

protocol StoreManagerProtocol {
    func saveObject<T: Encodable>(object: T, filename: String) throws

    func getObject<T: Decodable>(filename: String) throws -> T
}

struct StoreManager: StoreManagerProtocol {
    static let shared = StoreManager()

    func saveObject<T: Encodable>(object: T, filename: String) throws {
        let objectData = try JSONEncoder().encode(object)

        let cachesDirectory = getCachesDirectory()
        let storageURL = cachesDirectory.appendingPathComponent(filename,
                                                                isDirectory: false)
        try objectData.write(to: storageURL)
    }

    func getObject<T: Decodable>(filename: String) throws -> T {
        let cachesDirectory = getCachesDirectory()
        let storageURL = cachesDirectory.appendingPathComponent(filename,
                                                                isDirectory: false)

        let objectData = try Data(contentsOf: storageURL)
        let object = try JSONDecoder().decode(T.self, from: objectData)

        return object
    }

    func getCachesDirectory() -> URL {
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)

        return paths[0]
    }
}
