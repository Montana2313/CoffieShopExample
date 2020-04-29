//
//  FirstViewModel.swift
//  Template
//
//  Created by Mac on 29.04.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import RxSwift


class FirstViewModel {
     let coffies = Coffes().getAll()
    
    let bucketArray = Variable([Bucket]())
    
    func addBucketArray(_ bucket : Bucket){
        self.bucketArray.value.append(bucket)
    }
    
    
}

