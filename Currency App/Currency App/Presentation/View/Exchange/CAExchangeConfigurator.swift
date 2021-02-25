//
//  CAExchangeConfigurator.swift
//  Currency App
//
//  Created by Juan Jesus Cueto Yabar on 25/02/21.
//

import Foundation

class CAExchangeConfigurator {
    
    private unowned var viewController: CAExchangeViewController
    
    init(from viewController: CAExchangeViewController) {
        self.viewController = viewController
    }
    
    func configure() -> CAExchangePresenterInput {
        return CAExchangePresenter(from: CAExchangeCurrencyInteractor(from: CAExchangeRepository()), view: self.viewController, router: CAExchangeRouter(from: self.viewController))
    }
}
