//
//  DeliveryViewController.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 10.12.2022.
//

import UIKit

class DeliveryViewController: UIViewController {

    @IBOutlet weak var MakeOrderDeliveryVC: UIButton!
    @IBOutlet weak var fullPriceDeliveryVC: UILabel!
    
    @IBAction func MakeOrderDeliveryVCTouchDownAction(_ sender: Any) {
        MakeOrderDeliveryVC.backgroundColor = .orange.withAlphaComponent(0.7)
    }
    
    
    @IBAction func MakeOrderDeliveryVCAction(_ sender: Any) {
        MakeOrderDeliveryVC.backgroundColor = .orange
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MakeOrderDeliveryVC.layer.cornerRadius = 20
        fullPriceDeliveryVC.text = "\(fullPrice) ₽"
        
    }
    


}
