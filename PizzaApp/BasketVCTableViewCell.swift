//
//  BasketVCTableViewCell.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 25.11.2022.
//

import UIKit
import AudioToolbox

class BasketVCTableViewCell: UITableViewCell {
    
    
    var basketTableView = BasketViewController()
    
    @IBOutlet weak var PizzaTitleBasketVC: UILabel!
    @IBOutlet weak var PizzaImageBasketVC: UIImageView!
    @IBOutlet weak var PizzaDescriptionBasketVC: UILabel!
    @IBOutlet weak var PizzaSumPriceBasketVC: UILabel!
    @IBOutlet weak var PizzaCountNumberBasketVC: UILabel!
    @IBOutlet weak var PizzaMinusNumberBasketVC: UIButton!
    @IBOutlet weak var PizzaPlusNumberBasketVC: UIButton!
    @IBAction func PizzaMinusNumberButtonBasketVC(_ sender: Any) {
    }

    
    @IBAction func PizzaPlusNumberButtonBasketVC(_ sender: Any) {
        PizzaCountNumberBasketVC.text = String(Int(PizzaCountNumberBasketVC.text!)! + 1)
        addPizzaToCart()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        PizzaMinusNumberBasketVC.layer.cornerRadius = 10
        PizzaPlusNumberBasketVC.layer.cornerRadius = 10
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

    
    
}
