//
//  VarDefines.swift
//  Template
//
//  Created by Mac on 7.04.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit

let screenWith = UIScreen.main.bounds.width
let screenHeigth = UIScreen.main.bounds.height


// RENK Tanımlamaları
let labelColor = UIColor(red: 0.69, green: 0.51, blue: 0.43, alpha: 1.00)

//Images
let bucketImage = UIImage(named: "washing.png")
let whiteChoclateMochaImage = UIImage(named: "food.png")
let latteImage = UIImage(named:"food-and-restaurant.png")
let meatBowlsImage = UIImage(named: "food-and-restaurant-4.png")
let whiteMochaImage = UIImage(named: "food-and-restaurant-3.png")
let teaImage = UIImage(named: "food-and-restaurant-2.png")
let filterCoffeImage = UIImage(named: "food-2.png")
let turkishCoffeImage = UIImage(named: "cup.png")
let milkShakeImage = UIImage(named: "cup-2.png")
let teaAndKuruvasanImage = UIImage(named: "croissant.png")


// Font Tanımlamaları
let exapmleFont = UIFont(name: "Helvetica", size: 20.0)


// Diğer Değiken Tanımlamlamaları
var currentUserId : String {
    get{
//        return Auth.auth().currentUser!.uid
         return ""
    }
}
