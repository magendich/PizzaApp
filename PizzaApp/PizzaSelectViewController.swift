//
//  PizzaSelectViewController.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 24.11.2022.
//

import UIKit

class PizzaSelectViewController: UIViewController {
    
    var pizzaModelSelectVC: Pizza!
    var addToBasketButtonCloureForMakeOrderButton: (() -> ())?
    
    @IBOutlet weak var pizzaImageSelectController: UIImageView!
    @IBOutlet weak var pizzaTitleSelectController: UILabel!
    @IBOutlet weak var pizzaDescriptionSelectController: UILabel!
    @IBOutlet weak var pizzaIngredientsSelectController: UILabel!
    @IBOutlet weak var addToBasketOutlet: UIButton!
    @IBAction func addToBasketButton(_ sender: Any) {
        pizzaTitleSelectControllerForCheck = pizzaTitleSelectController.text!
        addPizzaToCart()
        calculationTotalAmount()
        hideTableView = false
        showToast(message: "Товар добавлен в корзину")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addToBasketOutlet.layer.cornerRadius = 20
        
        pizzaImageSelectController.downloaded(from: pizzaModelSelectVC!.img )
        pizzaTitleSelectController.text = pizzaModelSelectVC?.title
        pizzaDescriptionSelectController.text = pizzaModelSelectVC?.description
        pizzaIngredientsSelectController.text = pizzaModelSelectVC?.ingridients.joined(separator: ", ")

        addToBasketOutlet.setTitle("Добавить в корзину за \(pizzaModelSelectVC!.price) ₽", for: .normal)

        
    }
    
    
    
    // MARK: Метод, который добавляет toaster (уведомление), что товар добавлен в корзину.
    func showToast(message: String) {
        let toastLabel = UILabel(frame: CGRect(x: Int((self.view.frame.size.width)/2) - 85,
                                               y: Int(self.view.frame.size.height) - 777, width: 170, height: 35))
        print(Int(self.view.frame.size.width))
        print(Int(self.view.frame.size.height))
        print(Int((self.view.frame.size.width)/2) - 85)
        print(Int(self.view.frame.size.height) - 777)
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont(name: "Chalkboard SE Regular", size: 12.0)
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        view.addSubview(toastLabel)
        UIView.animate(withDuration: 1.5, delay: 0.1, options: .curveEaseIn, animations: {
            toastLabel.alpha = 0.0
        }, completion:  {(iscCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
