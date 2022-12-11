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

        datePickerDeliveyTime.inputView = datePicker
        datePicker.datePickerMode = .dateAndTime
        let localID = Locale.preferredLanguages.first
        datePicker.locale = Locale(identifier: localID!)
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([flexSpace,doneButton], animated: true)
        
        datePickerDeliveyTime.inputAccessoryView = toolBar
        
    }
    
    @objc func doneAction(){
        
    }

}
