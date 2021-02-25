//
//  CAExchangeRepositoryProtocol.swift
//  Currency App
//
//  Created by Juan Jesus Cueto Yabar on 25/02/21.
//

import Foundation

protocol CAExchangeRepositoryProtocol: class {
    func getAllCurrencies(success: @escaping() -> Void, failure: @escaping() -> Void)
}
