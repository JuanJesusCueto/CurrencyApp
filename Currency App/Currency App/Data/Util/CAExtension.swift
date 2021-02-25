//
//  CAExtension.swift
//  Currency App
//
//  Created by Juan Jesus Cueto Yabar on 25/02/21.
//

import Foundation

extension Decodable {
    init(dict: [String: Any]) throws {
        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: [])
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self, from: jsonData)
    }
}
