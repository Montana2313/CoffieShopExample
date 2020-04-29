//
//  DetailViewModel.swift
//  Template
//
//  Created by Mac on 29.04.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class DetailViewModel {
    var coffie = Coffes()
    var totalCount = Variable(0)
    var my_Bucket = Variable([Bucket]())
    
    func addItem(){
        totalCount.value = totalCount.value + 1
    }
    func removeItem(){
        totalCount.value = totalCount.value - 1
    }
    func add2Cart(_ coffie : Coffes , count:Int , totalPrice:Int){
        self.my_Bucket.value.append(Bucket(coffie: coffie, count: count, total: totalPrice))
    }
    
    func set(_ viewController:CoffieDetailVC){
        viewController.CoffieNameTop.text = coffie.coffename
        viewController.CoffieImage.image = coffie.coffeImage
        viewController.name.text = coffie.coffename
        viewController.price.text = "\(coffie.price) TLs"
    }
    
}
