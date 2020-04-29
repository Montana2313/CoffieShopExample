//
//  CustomizeItems.swift
//  Template
//
//  Created by Mac on 30.09.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

class CustomizeItems {
    static let referance = CustomizeItems()
    func roundedView25(with view:UIView){
        view.layer.cornerRadius = view.frame.size.width / 25.0
        view.layer.masksToBounds = true
        view.clipsToBounds = true
    }
    func roundedButton25(with button:UIButton){
        button.layer.cornerRadius = button.frame.size.width / 25.0
        button.layer.masksToBounds = true
        button.clipsToBounds = true
    }
    func roundedTextfield25(with textfield:UITextField){
        textfield.layer.cornerRadius = textfield.frame.size.width / 25.0
        textfield.layer.masksToBounds = true
        textfield.clipsToBounds = true
    }
    func roundedImageView(with imageView:UIImageView){
        imageView.layer.cornerRadius = imageView.frame.size.width / 2.0
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
    }
    func customAppBarButtons(with leftButton:UIButton,andRigth:UIButton,currentView:UIView){
          leftButton.frame = CGRect(x: 20, y: 40, width: 45, height: 40)
          andRigth.frame = CGRect(x: screenWith - 80, y: 40, width: 45, height: 40)
          currentView.addSubview(leftButton)
          currentView.addSubview(andRigth)
    }
    func customTabbarSelector(countOfItems:Int,andCurrentView:UIView,andSelectorColor : UIColor) {
        if countOfItems == 2 {
            let value = andCurrentView.frame.size.width / 2
            let selector = DefaultItems.referance.defView(withColor: andSelectorColor)
            selector.frame = CGRect(x: value - 20, y:0, width: 20, height: andCurrentView.frame.size.height)
            andCurrentView.addSubview(selector)
        }else if countOfItems == 3 {
            let value = andCurrentView.frame.size.width / 3
            let selector = DefaultItems.referance.defView(withColor: andSelectorColor)
            selector.frame = CGRect(x: value - 10, y:0, width: 20, height: andCurrentView.frame.size.height)
            andCurrentView.addSubview(selector)
            let selector2 = DefaultItems.referance.defView(withColor: andSelectorColor)
            selector2.frame = CGRect(x:value + value - 10, y:0, width: 20, height: andCurrentView.frame.size.height)
            andCurrentView.addSubview(selector2)
        }else if countOfItems == 4 {
            let value = andCurrentView.frame.size.width / 4
            let selector = DefaultItems.referance.defView(withColor: andSelectorColor)
            selector.frame = CGRect(x: value - 10, y:0, width: 20, height: andCurrentView.frame.size.height)
            andCurrentView.addSubview(selector)
            let selector2 = DefaultItems.referance.defView(withColor: andSelectorColor)
            selector2.frame = CGRect(x:value + value - 10, y:0, width: 20, height: andCurrentView.frame.size.height)
            andCurrentView.addSubview(selector2)
            let selector3 = DefaultItems.referance.defView(withColor: andSelectorColor)
            selector3.frame = CGRect(x:value + value + value - 10, y:0, width: 20, height: andCurrentView.frame.size.height)
            andCurrentView.addSubview(selector3)
        }
    }
    func customTabbarButton(totalItemsCount:Int,itemNumber:Int,buttonItem:UIButton,currentView:UIView) {
        if totalItemsCount == 2 {
            let value = currentView.frame.size.width / 2
            if itemNumber == 1 {
                buttonItem.frame = CGRect(x:15, y: 10, width:value - 50, height: 60)
            }else if itemNumber == 2 {
                buttonItem.frame = CGRect(x: value + 10, y: 10, width:screenWith - value - 20, height: 60)
            }
        }else if totalItemsCount == 3 {
            let value = currentView.frame.size.width / 3
            if itemNumber == 1 {
                    buttonItem.frame = CGRect(x:15, y: 10, width:value - 40, height: 60)
            }else if itemNumber == 2 {
                    buttonItem.frame = CGRect(x: value + 20, y: 10, width:screenWith - (value + value) - 40, height: 60)
            }else if itemNumber == 3 {
                    buttonItem.frame = CGRect(x: value + value + 20, y: 10, width: screenWith - value - value - 40, height: 60)
            }
            
        }
        currentView.addSubview(buttonItem)
    }
}
