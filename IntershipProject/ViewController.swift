//
//  ViewController.swift
//  IntershipProject
//
//  Created by Валерия Прокушева on 02.04.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet private weak var dateField: UITextField!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    enum Constants {
        static let datePickerCornerRadius: CGFloat = 6
        static let datePickerBorderWidth: CGFloat = 1
        static let datePickerColour = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        static let dateFormat = "dd.MM.YYYY"
        static let identifire = "CurrencyCell"
        static let cellCornerRadius: CGFloat = 12
        static let cellsCount: CGFloat = 3
        static let indentLeft: CGFloat = 23
        static let indentBetween: CGFloat = 8
        static let calendarFrame = CGRect(x: 0, y: 0, width: 18, height: 18)
        static let calendarIdentificator = "Calendar"
        static let save = "Сохранить"
        static let cancel = "Отмена"
   }
    private let datePicker = UIDatePicker()
    private let formatter = DateFormatter()
    private var currenciesMax = [currency1, currency2, currency3, currency4, currency5, currency6, currency7, currency8, currency9, currency10, currency11, currency12, currency13, currency14, currency15]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCurrentDate()
        setupCollectionView()
        setupDatePicker()
    }
    
    private func setupCurrentDate() {
        let currentDate = Date()
        formatter.dateFormat = Constants.dateFormat
        dateField.text = formatter.string(from: currentDate)
    }
    
    private func pickDate() {
        formatter.dateFormat = Constants.dateFormat
        dateField.text = formatter.string(from: datePicker.date)
    }
    
    private func setupDatePicker() {
        dateField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        dateField.rightViewMode = UITextField.ViewMode.always
        let image = UIImage(named: Constants.calendarIdentificator)
        let imageView = UIImageView(frame: Constants.calendarFrame)
        imageView.image = image
        dateField.rightView = imageView
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let saveButton = UIBarButtonItem(title: Constants.save, style: .done, target: self, action: #selector(saveAction))
        let cancelButton = UIBarButtonItem(title: Constants.cancel, style: .plain, target: self, action: #selector(cancelAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, flexSpace, saveButton], animated: true)
        dateField.inputAccessoryView = toolBar
    }
    
    @objc private func saveAction() {
        pickDate()
        view.endEditing(true)
    }
    
    @objc private func cancelAction() {
        view.endEditing(true)
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: Constants.identifire, bundle: nil), forCellWithReuseIdentifier: Constants.identifire)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currenciesMax.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.identifire, for: indexPath) as? CurrencyCell else {
            fatalError("Could not find cell with identifier: \(CurrencyCell())")
        }
        let currency = currenciesMax[indexPath.item]
        cell.setupCell(data: currency)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: ((collectionView.frame.width - Constants.indentLeft * 2) - (Constants.indentBetween * (Constants.cellsCount - 1))) / Constants.cellsCount,
            height: ((collectionView.frame.width - Constants.indentLeft * 2) - (Constants.indentBetween * (Constants.cellsCount - 1))) / Constants.cellsCount)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "DetailCurrencyViewController") as? DetailCurrencyViewController {
            let currency = currenciesMax[indexPath.item]
            vc.name = currency.name
            vc.price = currency.value
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
    

