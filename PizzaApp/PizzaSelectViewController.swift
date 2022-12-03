//
//  PizzaSelectViewController.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 24.11.2022.
//

import UIKit

class PizzaSelectViewController: UIViewController {
    
    var pizzaModelSelectVC: Pizza!
    
    @IBOutlet weak var pizzaImageSelectController: UIImageView!
    @IBOutlet weak var pizzaTitleSelectController: UILabel!
    @IBOutlet weak var pizzaDescriptionSelectController: UILabel!
    @IBOutlet weak var pizzaIngredientsSelectController: UILabel!
    @IBOutlet weak var addToBasketOutlet: UIButton!
    @IBAction func addToBasketButton(_ sender: Any) {
        pizzaTitleSelectControllerForCheck = pizzaTitleSelectController.text!
        addPizzaToCart()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.overrideUserInterfaceStyle = .light
        addToBasketOutlet.layer.cornerRadius = 20
        
        pizzaImageSelectController.downloaded(from: pizzaModelSelectVC!.img )
        pizzaTitleSelectController.text = pizzaModelSelectVC?.title
        pizzaDescriptionSelectController.text = pizzaModelSelectVC?.description
        pizzaIngredientsSelectController.text = pizzaModelSelectVC?.ingridients.joined(separator: ", ")

        addToBasketOutlet.setTitle("Добавить в корзину за \(pizzaModelSelectVC!.price) ₽", for: .normal)

        
    }

}
