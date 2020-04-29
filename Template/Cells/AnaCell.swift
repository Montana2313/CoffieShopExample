//
//  exCell.swift
//  Template
//
//  Created by Mac on 30.09.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit
class AnaCell: UITableViewCell {
    private var coffeImage : UIImageView = {
        let image = UIImageView(image: filterCoffeImage)
        image.backgroundColor = labelColor
        image.frame = CGRect(x: 20, y: 20, width: 60, height: 60)
        return image
   }()
    private var coffeName : UILabel = {
        let lbl = DefaultItems.referance.defLabel(withText: "", andLabelColor: labelColor)
        lbl.frame = CGRect(x: 90, y: 20, width: screenWith - 180, height: 60)
        return lbl
    }()
       override func awakeFromNib() {
           super.awakeFromNib()
       }
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style , reuseIdentifier: reuseIdentifier)
          self.addSubview(self.coffeName)
          self.addSubview(self.coffeImage)
       }
        func setCoffie(_ coffe:Coffes){
            self.coffeName.text = coffe.coffename
            self.coffeImage.image = coffe.coffeImage
        }
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

           // Configure the view for the selected state
       }
}
