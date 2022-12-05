//
//  DataBase.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 29.11.2022.
//

import Foundation


var pizzaDataBase: [Pizza] = [] // массив структур пицц, чтобы хранить там полученные пиццы из сети

var pizzaTitleSelectControllerForCheck: String = "" // переменная, в которую присваивается название пиццы на экране выбора пиццы, для дальнейшей проверки с массивом pizzaDataBase

var pizzaInCartTableView: Pizza? // переменная, в которую присвается пицца, в tableview в корзине для дальнейшей проверки
