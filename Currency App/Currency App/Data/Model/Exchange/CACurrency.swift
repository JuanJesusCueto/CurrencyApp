//
//  CACurrency.swift
//  Currency App
//
//  Created by Juan Jesus Cueto Yabar on 25/02/21.
//

import Foundation

struct CACurrencies: Codable {
    let currencyData: [CACurrency]
}

struct CACurrency: Codable {
    let id: String
    let name: String
    let ratio: Double
}
