//
//  BucketViewModel.swift
//  Template
//
//  Created by Mac on 30.04.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import  RxSwift


class BucketViewModel{
    let bucketArray = Variable([Bucket]())
    
    func getTotalPrice()->Int{
        var total = 0
        self.bucketArray.value.forEach { (item) in
            total += item.totalPrice
        }
        return total
    }
    func removeFromArray(_ indexnumber :Int){
        self.bucketArray.value.remove(at: indexnumber)
    }
    
    
}
