//
//  CAExchangeRouter.swift
//  Currency App
//
//  Created by Juan Jesus Cueto Yabar on 25/02/21.
//

import Foundation

protocol CAExchangeRouterInput: class {
    func routeToSelection()
}

class CAExchangeRouter {
    
    private unowned var viewController: CAExchangeViewController
    
    init(from viewController: CAExchangeViewController) {
        self.viewController = viewController
    }
}

extension CAExchangeRouter: CAExchangeRouterInput {
    func routeToSelection() {
        
    }
}
