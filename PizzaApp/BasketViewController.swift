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
        let deliveryVC = storyboard?.instantiateViewController(withIdentifier: "DeliveryViewController") as! DeliveryViewController
        
        self.present(deliveryVC, animated: true, completion: nil)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //overrideUserInterfaceStyle = .light
        MakeOrderOutlet.layer.cornerRadius = 20
        MakeOrderOutlet.setTitle("Оформить заказ на \(fullPrice) ₽", for: .normal)
        
        BasketVCTableView.delegate = self
        BasketVCTableView.dataSource = self
    
        if items.isEmpty {
            BasketVCTableView.isHidden = true
            MakeOrderOutlet.isHidden = true
            self.BasketVCTableView.reloadData()

        } else {
            BasketVCTableView.isHidden = false
            MakeOrderOutlet.isHidden = false
            self.BasketVCTableView.reloadData()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        BasketVCTableView.reloadData()
        MakeOrderOutlet.setTitle("Оформить заказ на \(fullPrice) ₽", for: .normal)
        
        if hideTableView == false {
            self.BasketVCTableView.isHidden = false
            self.MakeOrderOutlet.isHidden = false
            self.BasketVCTableView.reloadData()
            print("UNHIDE")
        }
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
                    basketVCCell.hideTableViewClosure = {
                        self.BasketVCTableView.isHidden = true
                        self.MakeOrderOutlet.isHidden = true
                        self.BasketVCTableView.reloadData()
                        print("HIDE")
                    }
                }
            }
        
        return basketVCCell
    }
}
