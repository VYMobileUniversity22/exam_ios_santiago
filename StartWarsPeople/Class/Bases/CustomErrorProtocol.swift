//
//  CustomErrorProtocol.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
protocol CustomErrorProtocol: LocalizedError {
    var title: String? { get }
    var code: Int { get }
}

struct CustomError: CustomErrorProtocol {
    var title: String?

    var code: Int

    var errorDescription: String?

    var failureReason: String?

    init(description: String, code: Int) {
        self.code = code
        errorDescription = description
        failureReason = description
    }
}
