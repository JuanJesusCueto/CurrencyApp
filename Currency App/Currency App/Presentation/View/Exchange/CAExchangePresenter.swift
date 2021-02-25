//
//  CAExchangePresenter.swift
//  Currency App
//
//  Created by Juan Jesus Cueto Yabar on 25/02/21.
//

import Foundation

protocol CAExchangePresenterInput: class {
    func loadData()
    func updateCurrencies(from tag: Int)
    func calculateAmount()
    func updateSendAmount(value: String)
}

class CAExchangePresenter {
    
    private var interactor: CAExchangeCurrencyUseCase
    private weak var output: CAExchangeView?
    private var router: CAExchangeRouterInput
    private var sendAmount: Double
    private var currenciesArray: CACurrencies
    private var currencyData: CACurrencyModel
    private var selectedCurrencies: [CACurrency]
    private var currentUpdatedIndex: Int
    
    init(from interactor: CAExchangeCurrencyUseCase, view: CAExchangeView?, router: CAExchangeRouterInput) {
        self.interactor = interactor
        self.router = router
        self.output = view
        self.currenciesArray = CACurrencies(currencyData: [])
        self.currencyData = CACurrencyModel(firstCurrencyname: "", secondCurrencyName: "", buy: 0, sell: 0)
        self.selectedCurrencies = []
        self.sendAmount = 0.0
        self.currentUpdatedIndex = 0
    }
}

extension CAExchangePresenter: CAExchangePresenterInput {
    func updateSendAmount(value: String) {
        self.sendAmount = Double(value) ?? 0.00
    }
    
    func loadData() {
        self.interactor.loadAllCurrencies { [unowned self] (currencies, data, selectedCurrencies) in
            self.currencyData = data
            self.selectedCurrencies = selectedCurrencies
            self.currenciesArray = currencies
            self.output?.didRetrieveData(buttonOne: data.firstCurrencyname, buttonTwo: data.secondCurrencyName, exchangeValue: "Compra: \(data.buy) | venta: \(data.sell)")
        } failure: {
        }

    }
    
    func updateCurrencies(from tag: Int) {
        self.currentUpdatedIndex = tag
        self.router.routeToSelection()
    }
    
    func calculateAmount() {
        self.interactor.calculateExchange(from: self.currencyData, amount: self.sendAmount) { [unowned self] (newAmount) in
            self.output?.updateNewAmount(value: "\(newAmount)")
        }
    }
}
