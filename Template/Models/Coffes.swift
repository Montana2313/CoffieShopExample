//
//  Coffes.swift
//  Template
//
//  Created by Mac on 29.04.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit

struct Coffes {
    var id:Int = 0
    var coffename:String = ""
    var coffeImage:UIImage = UIImage()
    var price : Int = 0
    init(id:Int , name: String , image: UIImage , price:Int) {
        self.id = id
        self.coffename = name
        self.coffeImage = image
        self.price = price
    }
    init() {}
    func getAll()->[Coffes]{
        var array = [Coffes]()
        array.append(Coffes(id: 1, name: "White Choaclate Mocha", image: whiteChoclateMochaImage!, price: 20))
        array.append(Coffes(id: 2, name: "Latte", image: latteImage!, price: 12))
        array.append(Coffes(id: 3, name: "Meat Bowls", image: meatBowlsImage!, price: 30))
        array.append(Coffes(id: 4, name: "White Mocha", image: whiteMochaImage!, price: 10))
        array.append(Coffes(id: 5, name: "Tea", image: teaImage!, price: 7))
        array.append(Coffes(id: 6, name: "Filter Coffe", image: filterCoffeImage!, price: 9))
        array.append(Coffes(id: 7, name: "Turkish Coffe", image: turkishCoffeImage!, price: 15))
        array.append(Coffes(id: 8, name: "Milk Shake", image: milkShakeImage!, price: 12))
        array.append(Coffes(id: 9, name: "Tea And Crouvasane", image: teaAndKuruvasanImage! , price: 20))
        
        return array
    }
}

struct Bucket {
    var Coffie:Coffes = Coffes()
    var count:Int = 0
    var totalPrice = 0
    init(coffie:Coffes , count :Int , total : Int) {
        self.Coffie = coffie
        self.count = count
        self.totalPrice = total
    }
}
