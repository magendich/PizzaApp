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
        MakeOrderOutlet.titleLabel?.text = "Оформить заказ на "
 
        BasketVCTableView.delegate = self
        BasketVCTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        BasketVCTableView.reloadData()
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
        
        let basketVCCell = BasketVCTableView.dequeueReusableCell(withIdentifier: idBasketCell) as! BasketVCTableViewCell
            
        
            basketVCCell.PizzaTitleBasketVC.text = items[indexPath.row].pizza.title
            basketVCCell.PizzaImageBasketVC.downloaded(from: items[indexPath.row].pizza.img)
            basketVCCell.PizzaDescriptionBasketVC.text = items[indexPath.row].pizza.description
            basketVCCell.PizzaCountNumberBasketVC.text = "\(items[indexPath.row].count)"
        basketVCCell.PizzaSumPriceBasketVC.text = "\(items[indexPath.row].sumPrice)"
        
        
        return basketVCCell
        }
}
