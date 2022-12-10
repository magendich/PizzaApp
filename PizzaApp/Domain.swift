//
//  Domain.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 16.11.2022.
//

import Foundation


struct Pizza: Decodable, Hashable {

    let title: String
    var price: String
    let img: String
    let description: String
    var ingridients: [String]
}


struct PizzaOrdered: Hashable {

    var pizza: Pizza?
    var count: Int
    var sumPrice: Int {
        get {
            return Int(pizza?.price ?? "nil")! * count
        }
    }
}


var pizzaOrdered: PizzaOrdered? = nil

struct Cart: Hashable {
    
    var items: [PizzaOrdered]
}

var items = [PizzaOrdered]()

struct DeliveryInfo {
    
    let name: String
    let phone: String
    let city: String
    let street: String
    let houseNumber: String
    
    enum PaymentType {
        case cash
        case cardOffline
        case cardOnline
    }
}
