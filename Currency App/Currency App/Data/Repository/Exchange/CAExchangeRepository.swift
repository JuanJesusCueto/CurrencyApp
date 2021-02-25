//
//  CAExchangeRepository.swift
//  Currency App
//
//  Created by Juan Jesus Cueto Yabar on 25/02/21.
//

import Foundation

class CAExchangeRepository {
    init() {}
}

extension CAExchangeRepository: CAExchangeRepositoryProtocol {
    func getAllCurrencies(success: @escaping (CACurrencies) -> Void, failure: @escaping () -> Void) {
        guard let path = Bundle.main.path(forResource: "Currencies", ofType: "plist") else {return}
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        guard let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [[String: Any]] else {return}
        var dict: [[String: Any]] = []
        for value in plist {
            dict.append(value)
        }
        let currencyData = ["currencyData": dict]
        let currencies = try! CACurrencies(dict: currencyData)
        success(currencies)
    }
}
