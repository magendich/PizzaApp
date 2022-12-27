//
//  EnterAddressViewController.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 26.12.2022.
//

import UIKit

// MARK: Проток делегата для передачи данных адреса между контроллерами карты и полями ввода адреса

protocol TransferAddressFromMapDelegate {
    func updateAdress(deliInfo: DeliveryInfo)
}

class EnterAddressViewController: UIViewController, UITextFieldDelegate, TransferAddressFromMapDelegate {
    
    // MARK: Метод протокола TransferAddressFromMapDelegate
    
    func updateAdress(deliInfo: DeliveryInfo) {
        CityTextField.text = deliInfo.city
        StreetTextField.text = deliInfo.street
        HouseNumberTextField.text = deliInfo.house
    }
    
    @IBOutlet weak var CityTextField: UITextField!
    @IBOutlet weak var StreetTextField: UITextField!
    @IBOutlet weak var HouseNumberTextField: UITextField!
    @IBAction func ReadyAddressButton(_ sender: Any) {
        if CityTextField.text?.isEmpty == false ||  StreetTextField.text?.isEmpty == false || HouseNumberTextField.text?.isEmpty == false {
            deliveryInfo = DeliveryInfo(city: CityTextField.text ?? "", street: StreetTextField.text ?? "", house: HouseNumberTextField.text ?? "")
            print(deliveryInfo)
            dismiss(animated: true)
        }
    }
    @IBOutlet weak var orShowOnMap: UIButton!
    @IBAction func orShowOnMapAction(_ sender: Any) {
    }
    
    // MARK: Переход для делегата передачи даных адреса из карты в поля данных доставки
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mapAddressVC = segue.destination as? MapAddressViewController {
            mapAddressVC.tranferAddressDelegate = self
        }
    }
    
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
    }
}
