//
//  DeliveryTableViewController.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 11.12.2022.
//

import UIKit

class DeliveryTableViewController: UITableViewController {
    
        
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var UserNumberTextField: UITextField!
    let toolBar = UIToolbar()
    
    @IBOutlet weak var datePickerDeliveyTime: UITextField!
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var ByCardInAppPaymentOutlet: UIButton!
    @IBOutlet weak var ByCardToCourierPaymentOutlet: UIButton!
    @IBOutlet weak var ByCashPaymentOutlet: UIButton!
    
    
    // MARK: Методы для работы с radio button
    
    @IBAction func ByCardInAppPaymentRadioButton(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            ByCardToCourierPaymentOutlet.isSelected = false
            ByCashPaymentOutlet.isSelected = false
        } else {
            sender.isSelected = true
            ByCardToCourierPaymentOutlet.isSelected = false
            ByCashPaymentOutlet.isSelected = false
        }
    }
    @IBAction func ByCardToCourierPaymentRadioButton(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            ByCardInAppPaymentOutlet.isSelected = false
            ByCashPaymentOutlet.isSelected = false
        } else {
            sender.isSelected = true
            ByCardInAppPaymentOutlet.isSelected = false
            ByCashPaymentOutlet.isSelected = false
        }
    }
    @IBAction func ByCashPaymentRadioButton(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            ByCardInAppPaymentOutlet.isSelected = false
            ByCardToCourierPaymentOutlet.isSelected = false
        } else {
            sender.isSelected = true
            ByCardInAppPaymentOutlet.isSelected = false
            ByCardToCourierPaymentOutlet.isSelected = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userInfo != nil {
            UserNameTextField.text = userInfo?.name
            UserNumberTextField.text = userInfo?.phone
        }
        
        createDatePicker()
        createDoneButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(deliveryTime)
        if deliveryTime != "" {
            self.datePickerDeliveyTime.text = deliveryTime
        }
    }
    
    // MARK: Методы для создания и работы с toolBar и datePicker
        // MARK: Создание toolBar
    
    func createToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneBtn], animated: true)
        
        return toolBar
    }
    
        // MARK: Создание datePicker
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .time
        datePickerDeliveyTime.inputView = datePicker
        datePickerDeliveyTime.inputAccessoryView = createToolBar()
        datePicker.minuteInterval = 30
        datePicker.minimumDate = .now
    }
    
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        self.datePickerDeliveyTime.text = dateFormatter.string(from: datePicker.date)
        deliveryTime = self.datePickerDeliveyTime.text ?? ""
        print(deliveryTime)
        self.view.endEditing(true)
    }
    
        // MARK: Создание кнопки done (готово) на toolBar datePicker
    
    func createDoneButton() {
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Готово", style: .plain, target: self, action: #selector(doneButtonPressed))
        toolBar.setItems([doneButton], animated: true)
        UserNameTextField.inputAccessoryView = toolBar
        UserNumberTextField.inputAccessoryView = toolBar
        
    }
    @objc func doneButtonPressed() {
        if UserNameTextField.text?.isEmpty == false || UserNumberTextField.text?.isEmpty == false {
            userInfo = UserInfo(name: UserNameTextField.text ?? "", phone: UserNumberTextField.text ?? "")
            self.view.endEditing(true)
            print(userInfo)
        }
        self.view.endEditing(true)
    }
    
}
