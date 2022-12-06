//
//  BasketViewController.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 25.11.2022.
//

import UIKit
import Alamofire

class BasketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var PizzaModelBasketVC = [Pizza]()
    
    @IBOutlet weak var BasketVCTableView: UITableView!
    @IBOutlet weak var MakeOrderOutlet: UIButton!
    @IBAction func MakeOrderButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //overrideUserInterfaceStyle = .light
        MakeOrderOutlet.layer.cornerRadius = 20
        MakeOrderOutlet.setTitle("Оформить заказ на \(fullPrice) ₽", for: .normal)
        
        BasketVCTableView.delegate = self
        BasketVCTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        BasketVCTableView.reloadData()
        MakeOrderOutlet.setTitle("Оформить заказ на \(fullPrice) ₽", for: .normal)
    }
    

    
    // MARK: Методы для работы с Tableview
    
    var idBasketCell = "PizzaBasketCell"
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let basketVCCell = BasketVCTableView.dequeueReusableCell(withIdentifier: idBasketCell, for: indexPath) as! BasketVCTableViewCell
        
        if items.count == indexPath.row {
            self.BasketVCTableView.reloadData()
            
        } else {
            basketVCCell.PizzaTitleBasketVC.text = items[indexPath.row].pizza?.title
            basketVCCell.PizzaImageBasketVC.downloaded(from: items[indexPath.row].pizza?.img ?? "nil")
            basketVCCell.PizzaDescriptionBasketVC.text = items[indexPath.row].pizza?.description
            basketVCCell.PizzaCountNumberBasketVC.text = "\(items[indexPath.row].count)"
            basketVCCell.PizzaSumPriceBasketVC.text = "\(items[indexPath.row].sumPrice)"
            
            basketVCCell.plusOneButtonClosure = {
                pizzaInCartTableView = items[indexPath.row].pizza
                self.BasketVCTableView.reloadData()
            basketVCCell.plusOrMinusButtonCloureForMakeOrderButton = {
                self.MakeOrderOutlet.setTitle("Оформить заказ на \(fullPrice) ₽", for: .normal)
                }
            }
        }
        
        return basketVCCell
    }
}
