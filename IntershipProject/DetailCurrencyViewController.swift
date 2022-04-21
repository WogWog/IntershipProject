//
//  DetailCurrencyViewController.swift
//  IntershipProject
//
//  Created by Валерия Прокушева on 17.04.2022.
//

import UIKit

class DetailCurrencyViewController: UIViewController {

    @IBOutlet private weak var nameDetailLabel: UILabel!
    @IBOutlet private weak var rateLabel: UILabel!
    @IBOutlet private weak var priceDetailLabel: UILabel!
    @IBOutlet private weak var currencyTextField: UITextField!
    @IBOutlet private weak var rubleTextField: UITextField!
    @IBOutlet private weak var currencyLabel: UILabel!
    @IBOutlet private weak var rubleLabel: UILabel!
    @IBAction private func actionTextField(_ sender: Any) {
        calculate()
    }
    
    enum Constants {
        static let zero: Double = 0
    }
    
    private var isNewValue: Bool = true
    var name = ""
    var price = Double()

    override func viewDidLoad() {
        super.viewDidLoad()
        line(textField: currencyTextField)
        line(textField: rubleTextField)
        setupLabels()
    }
    
    private func setupLabels() {
        priceDetailLabel.text = String(price)
        nameDetailLabel.text = name
        currencyLabel.text = name
    }
    
    private func calculate() {
        var currencyValue = Constants.zero
        var priceValue = Constants.zero
        var result = Constants.zero
        if let number1 = priceDetailLabel.text, let value1 = Double(number1){
            priceValue = value1
        }
        if let number2 = currencyTextField.text, let value2 = Double(number2){
            currencyValue = value2
        }
        result = Double(currencyValue * priceValue)
        rubleTextField.text = String(result)
    }
    
    private func line(textField: UITextField){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(
            x: 0.0,
            y: textField.frame.height - 1,
            width: textField.frame.width - 20,
            height: 0.5)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
    }
}


