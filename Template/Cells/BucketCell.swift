//
//  BucketCell.swift
//  Template
//
//  Created by Mac on 30.04.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit
class BucketCell: UITableViewCell {
    private var coffeImage : UIImageView = {
        let image = UIImageView(image: filterCoffeImage)
        image.backgroundColor = labelColor
        image.frame = CGRect(x: 20, y: 20, width: 60, height: 60)
        return image
   }()
    private var coffeName : UILabel = {
        let lbl = DefaultItems.referance.defLabel(withText: "", andLabelColor: labelColor)
        lbl.frame = CGRect(x: 90, y: 20, width: screenWith - 280, height: 60)
        return lbl
    }()
    private var totalPrice  : UILabel = {
        let lbl = DefaultItems.referance.defLabel(withText: "", andLabelColor: labelColor)
        lbl.frame = CGRect(x: screenWith - 210, y: 20, width: 150, height: 60)
        lbl.textAlignment = .right
        return lbl
    }()
       override func awakeFromNib() {
           super.awakeFromNib()
       }
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style , reuseIdentifier: reuseIdentifier)
          self.addSubview(self.coffeName)
          self.addSubview(self.coffeImage)
          self.addSubview(self.totalPrice)
       }
        func setCoffie(_ bucket:Bucket){
            self.coffeName.text = bucket.Coffie.coffename
            self.coffeImage.image = bucket.Coffie.coffeImage
            self.totalPrice.text = "\(bucket.totalPrice) TL"
        }
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

           // Configure the view for the selected state
       }
}
