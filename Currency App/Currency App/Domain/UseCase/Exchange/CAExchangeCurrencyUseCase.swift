//
//  CAExchangeCurrencyUseCase.swift
//  Currency App
//
//  Created by Juan Jesus Cueto Yabar on 25/02/21.
//

import Foundation

protocol CAExchangeCurrencyUseCase: class {
    func loadAllCurrencies(success: @escaping(CACurrencies, CACurrencyModel, [CACurrency]) -> Void, failure: @escaping() -> Void)
    func calculateExchange(from currencies: CACurrencyModel, amount: Double, completion: @escaping(Double) -> Void)
    func updateExchange(from currencies: [CACurrency], completion: @escaping(CACurrencyModel) -> Void)
}

class CAExchangeCurrencyInteractor {
    
    private var repository: CAExchangeRepositoryProtocol
    
    init(from repository: CAExchangeRepositoryProtocol) {
        self.repository = repository
    }
}

extension CAExchangeCurrencyInteractor: CAExchangeCurrencyUseCase {
    func loadAllCurrencies(success: @escaping (CACurrencies, CACurrencyModel, [CACurrency]) -> Void, failure: @escaping () -> Void) {
        self.repository.getAllCurrencies { [unowned self] (currencies) in
            let userCurrencies = [currencies.currencyData.last!, currencies.currencyData.first!]
            self.updateExchange(from: userCurrencies) { (currencyModel) in
                success(currencies, currencyModel, userCurrencies)
            }
        } failure: {
            failure()
        }

    }
    
    func calculateExchange(from currencies: CACurrencyModel, amount: Double, completion: @escaping (Double) -> Void) {
        completion(amount * currencies.sell)
    }
    
    func updateExchange(from currencies: [CACurrency], completion: @escaping (CACurrencyModel) -> Void) {
        let convertedRatio = (currencies.last?.ratio ?? 0.0) / (currencies.first?.ratio ?? 1.0)
        completion(CACurrencyModel(firstCurrencyname: currencies.first?.name ?? "", secondCurrencyName: currencies.last?.name ?? "", buy: (1 * convertedRatio) - 0.2, sell: (1 * convertedRatio) + 0.2))
    }
}
