//
//  ViewController.swift
//  Currency App
//
//  Created by Juan Jesus Cueto Yabar on 25/02/21.
//

import UIKit

protocol CAExchangeView: class {
    func didRetrieveData(buttonOne: String, buttonTwo: String, exchangeValue: String)
    func updateNewAmount(value: String)
}

class CAExchangeViewController: UIViewController {

    @IBOutlet weak var firstCurrencyButton: UIButton!
    @IBOutlet weak var secondAmountTextField: UITextField!
    @IBOutlet weak var firstAmountTextField: UITextField!
    @IBOutlet weak var secondCurrencyButton: UIButton!
    @IBOutlet weak var exchangeLabel: UILabel!
    // Properties
    private lazy var configurator: CAExchangeConfigurator = { return CAExchangeConfigurator(from: self) }()
    private lazy var presenter: CAExchangePresenterInput = { self.configurator.configure() }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.presenter.loadData()
    }

    @IBAction func sendEditingChangedAction(_ sender: UITextField) {
    }
    
    @IBAction func recieveEditingChangedAction(_ sender: UITextField) {
    }
}

extension CAExchangeViewController: CAExchangeView {
    func didRetrieveData(buttonOne: String, buttonTwo: String, exchangeValue: String) {
        self.firstCurrencyButton.setTitle(buttonOne, for: . normal)
        self.secondCurrencyButton.setTitle(buttonTwo, for: .normal)
        self.exchangeLabel.text = exchangeValue
        self.firstAmountTextField.text = ""
        self.secondAmountTextField.text = ""
    }
    
    func updateNewAmount(value: String) {
        self.secondAmountTextField.text = value
    }
}
