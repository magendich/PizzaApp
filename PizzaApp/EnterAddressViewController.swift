//
//  EnterAddressViewController.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 26.12.2022.
//

import UIKit

class EnterAddressViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var CityTextField: UITextField!
    @IBOutlet weak var StreetTextField: UITextField!
    @IBOutlet weak var HouseNumberTextField: UITextField!
    @IBAction func ReadyAddressButton(_ sender: Any) {
        if CityTextField.text?.isEmpty == false ||  StreetTextField.text?.isEmpty == false || HouseNumberTextField.text?.isEmpty == false {
            deliveryInfo = DeliveryInfo(city: CityTextField.text ?? "", street: StreetTextField.text ?? "", house: HouseNumberTextField.text ?? "")
            print(deliveryInfo)
            CityTextField.resignFirstResponder()
            StreetTextField.resignFirstResponder()
            HouseNumberTextField.resignFirstResponder()
        }
        CityTextField.resignFirstResponder()
    }
    @IBOutlet weak var orShowOnMap: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CityTextField.delegate = self
    
        if deliveryInfo != nil {
            CityTextField.text = deliveryInfo?.city
            StreetTextField.text = deliveryInfo?.street
            HouseNumberTextField.text = deliveryInfo?.house
        }
        
        orShowOnMap.layer.cornerRadius = 20
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        print(deliveryInfo)
        if deliveryInfo != nil {
            CityTextField.text = deliveryInfo?.city
            StreetTextField.text = deliveryInfo?.street
            HouseNumberTextField.text = deliveryInfo?.house
        }
        
        CityTextField.reloadInputViews()
        StreetTextField.reloadInputViews()
        HouseNumberTextField.reloadInputViews()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        CityTextField.resignFirstResponder()
        return true
    }
}
