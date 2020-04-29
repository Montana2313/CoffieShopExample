//
//  DefaultItems.swift
//  Template
//
//  Created by Mac on 29.09.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

class DefaultItems {
    static let referance = DefaultItems()
    func defTextField(withPlaceHolder:String, andHolderColor:UIColor)->UITextField{
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(string: withPlaceHolder, attributes: [NSAttributedString.Key.foregroundColor : andHolderColor])
        textfield.textColor = .black
        textfield.textAlignment = .center
        textfield.backgroundColor = .white
        return textfield
    }
    func defTextView(withText:String , andHolderColor:UIColor) -> UITextView {
        let textView = UITextView()
        textView.attributedText = NSAttributedString(string: withText, attributes: [NSAttributedString.Key.foregroundColor : andHolderColor])
        textView.textAlignment = .center
        textView.backgroundColor = .white
        return textView
    }
    func defButton(withText:String,andButtonColor:UIColor)->UIButton{
        let button = UIButton()
        button.setTitle(withText, for: .normal)
        button.backgroundColor = andButtonColor
        return button
    }
    func defButtonW(withImageName:String)->UIButton{
           let button = UIButton()
            button.setBackgroundImage(UIImage(named: withImageName), for: .normal)
           return button
       }
    func defLabel(withText:String,andLabelColor:UIColor) -> UILabel {
        let label = UILabel()
        label.text = withText
        label.textColor = andLabelColor
        return label
    }
    func defView(withColor : UIColor)->UIView{
        let view = UIView()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.white.cgColor
        view.backgroundColor = withColor
        return view
    }
    func defTableView(with registeredClass:AnyClass?)->UITableView{
        let tableView = UITableView()
        tableView.separatorStyle = .none
        if registeredClass != nil{
            tableView.register(registeredClass, forCellReuseIdentifier: "cell")
        }
        tableView.backgroundColor = .clear
        return tableView
    }
    func defAppBar(withColor : UIColor , andText:String , labelcolor : UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = withColor
        view.frame = CGRect(x: 0, y: 0, width: screenWith, height: 80)
        let label = defLabel(withText: andText, andLabelColor: .black)
        label.text = andText
        label.textColor = labelcolor
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 20.0)
        label.frame = CGRect(x: (screenWith / 2) - 50, y: 40 , width: 100, height: 40)
        view.addSubview(label)
        return view
    }
    func defSearchBar(withPlaceHolder:String)->UISearchBar{
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.placeholder = withPlaceHolder
        searchBar.backgroundColor = .clear
        searchBar.sizeToFit()
        searchBar.searchTextField.textColor = .black
        searchBar.isTranslucent = false
        return searchBar
    }
    func defTabbar(withColor:UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = withColor
        view.frame = CGRect(x: 0, y: screenHeigth - 80, width: screenWith, height: 80)
        return view
    }
    func defLeftButtonMenu(withimageNamed:String,orColor:UIColor?,andText:String)->UIButton{
        var sentButton = UIButton()
        if withimageNamed == "" {
           sentButton = defButton(withText: andText, andButtonColor: orColor!)
        }else {
           sentButton = defButtonW(withImageName: withimageNamed)
        }
        sentButton.frame = CGRect(x: 20, y: 40, width: screenWith - (screenWith - 60), height: 45)
        return sentButton
    }
}
