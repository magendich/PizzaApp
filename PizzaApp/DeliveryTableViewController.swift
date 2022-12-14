//
//  DeliveryTableViewController.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 11.12.2022.
//

import UIKit

class DeliveryTableViewController: UITableViewController {
    
    
    
    @IBOutlet weak var datePickerDeliveyTime: UITextField!
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var ByCardInAppPaymentOutlet: UIButton!
    @IBOutlet weak var ByCardToCourierPaymentOutlet: UIButton!
    @IBOutlet weak var ByCashPaymentOutlet: UIButton!
    
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

        createDatePicker()
    }
    
    func createToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneBtn], animated: true)
        
        return toolBar
    }
    
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
        self.view.endEditing(true)
    }

}
