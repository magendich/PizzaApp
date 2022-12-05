//
//  UseCases.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 17.11.2022.
//

import Foundation
import UIKit


func selectedPizzas() { // добавить выбранную пиццу в корзину
    var countInArray = 0
    for index in 0..<pizzaDataBase.count {
        if pizzaDataBase[index].title == pizzaTitleSelectControllerForCheck {
            print("SUCCESS")
            pizzaOrdered = PizzaOrdered(pizza: pizzaDataBase[index], count: 1)
            print(items.count)
            if items.count != 0 {
                print("pizzaOrdered записался")
                for i in 0..<items.count {
                    if items[i].pizza == pizzaOrdered!.pizza {
                        print(items[i].pizza, " РАВЕН", pizzaOrdered!.pizza)
                        countInArray += 1
                        if countInArray != 0 {
                            for i in 0..<items.count {
                                if pizzaOrdered!.pizza.title == items[i].pizza.title {
                                    items[i].count += 1
                                    print("count+=1, есть одинаковые")
                                    print(items)
                                    
                                }
                            }
                        }
                    } else {
                        if i == items.count - 1{
                            if countInArray == 0 {
                                items.append(pizzaOrdered!)
                                print("Добавляем pizzaOrdered, нет одинаковых")
                                print(items)
                            }
                        }
                    }
                }
            } else {
                items.append(pizzaOrdered!)
                print("добавляем первую пиццу в массив items")
                print(items)
            }
        }
    }
}


func addPizzaToCart() { // добавить пиццу в корзину +1 selectedPizzas
    var countInArray = 0
    for index in 0..<pizzaDataBase.count {
        if pizzaDataBase[index].title == pizzaTitleSelectControllerForCheck {
            print("SUCCESS")
            pizzaOrdered = PizzaOrdered(pizza: pizzaDataBase[index], count: 1)
            print(items.count)
            if items.count != 0 {
                print("pizzaOrdered записался")
                for i in 0..<items.count {
                    if items[i].pizza == pizzaOrdered!.pizza {
                        print(items[i].pizza, " РАВЕН", pizzaOrdered!.pizza)
                        countInArray += 1
                        if countInArray != 0 {
                            for i in 0..<items.count {
                                if pizzaOrdered!.pizza.title == items[i].pizza.title {
                                    items[i].count += 1
                                    print("count+=1, есть одинаковые")
                                    print(items)
                                    
                                }
                            }
                        }
                    } else {
                        if i == items.count - 1{
                            if countInArray == 0 {
                                items.append(pizzaOrdered!)
                                print("Добавляем pizzaOrdered, нет одинаковых")
                                print(items)
                            }
                        }
                    }
                }
            } else {
                items.append(pizzaOrdered!)
                print("добавляем первую пиццу в массив items")
                print(items)
            }
        }
    }
}


func plusOnePizzaToBasket() { // добавляется пицца в корзину при ражатии +1
    for i in 0..<items.count {
        if items[i].pizza == pizzaInCartTableView {
            items[i].count += 1
        }
    }
}

func removePizzaFromCart() { // удалить пиццу из массивы пицц, который лежит в корзине
    
    for i in 0..<items.count {
        if items[i].pizza == pizzaInCartTableView && items[i].count == 1 {
            items.remove(at: i)
            break
            
        } else if items[i].count != 1 && items[i].pizza == pizzaInCartTableView  {
            items[i].count -= 1
        }
    }
}


func clearCart() {
    // перелаем объект корзины, в котором будет лежать массив пицц и очищаем его
}

func chekout(deliveryInfo: DeliveryInfo) -> Bool {
    // проверка данных пользователя -> возвращаем Boolean
    return true
}

func validate(deliveryInfo: DeliveryInfo) -> Bool {
    // подтверждение данных, все ли ок? -> возвращаем Boolean
    return true
}

func pay() -> Bool {
    // выполняктся если клиент выбрал тип оплаты cardOnline, прошла ли оплата? -> возвращаем Boolean
    return true
}


