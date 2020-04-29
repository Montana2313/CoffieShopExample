//
//  CoffieDetailVC.swift
//  Template
//
//  Created by Mac on 29.04.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class CoffieDetailVC: UIViewController {
    let viewModel = DetailViewModel()
    let bag = DisposeBag()
    let defaultref = DefaultItems.referance
    lazy var CoffieNameTop : UILabel = UILabel()
    lazy var CoffieImage : UIImageView = UIImageView()
    lazy var name : UILabel = UILabel()
    lazy var price : UILabel = UILabel()
    private lazy var addOneButton : UIButton = UIButton()
    private lazy var removeOneButton : UIButton = UIButton()
    private lazy var totalLabel : UILabel = UILabel()
    private lazy var total : UILabel = UILabel()
    private lazy var add2Cart : UIButton = UIButton()
    private lazy var count : UILabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setCoffieNameTop()
        self.setCoffieImage()
        self.setName()
        self.setPrice()
        self.setAddOneButton()
        self.setRemoveOneButton()
        self.setAdd2CartButton()
        self.setTotalLabel()
        self.setTotal()
        self.setCount()
        
        self.viewModel.set(self)
        
        self.viewModel.totalCount.asObservable().map {$0 > 0  ? "\($0 * self.viewModel.coffie.price) TL" : "0 TL"}.bind(to: self.total.rx.text).disposed(by: self.bag)
        self.viewModel.totalCount.asObservable().map{$0 > 0 ? "x \($0)" : "x0"}.bind(to: self.count.rx.text).disposed(by: self.bag)
    }
    func setCoffieNameTop(){
        self.CoffieNameTop = defaultref.defLabel(withText: "", andLabelColor: labelColor)
        self.CoffieNameTop.font = UIFont(name: "Helvetica", size: 30.0)
        self.CoffieNameTop.textAlignment = .center
        self.CoffieNameTop.frame = CGRect(x: 20, y: 40, width: screenWith - 40, height: 40)
        self.view.addSubview(self.CoffieNameTop)
    }
    func setCoffieImage(){
        self.CoffieImage = UIImageView(frame: CGRect(x: 0, y: 80, width: screenWith, height: 300))
        self.CoffieImage.backgroundColor = labelColor
        self.CoffieImage.contentMode = .scaleAspectFit
        self.view.addSubview(self.CoffieImage)
    }
    func setName(){
        self.name = defaultref.defLabel(withText: "", andLabelColor: labelColor)
        self.name.font = UIFont(name: "Helvetica", size: 20.0)
        self.name.textAlignment = .left
        self.name.frame = CGRect(x: 20, y: 400, width: screenWith - 80, height: 20.0)
        self.view.addSubview(self.name)
    }
    func setPrice(){
        self.price = defaultref.defLabel(withText: "", andLabelColor: labelColor)
        self.price.font = UIFont(name: "Helvetica", size: 15.0)
        self.price.textAlignment = .left
        self.price.frame = CGRect(x: 20, y: 430, width: screenWith - 80, height: 15.0)
        self.view.addSubview(self.price)
    }
    func setAddOneButton(){
        self.addOneButton = defaultref.defButton(withText: "+", andButtonColor: .white)
        self.addOneButton.setTitleColor(labelColor, for: .normal)
        self.addOneButton.layer.borderWidth = 1.2
        self.addOneButton.layer.borderColor = labelColor.cgColor
        self.addOneButton.frame = CGRect(x: screenWith - 70, y: 400, width: 50, height: 30)
        self.addOneButton.addTarget(self, action: #selector(addItem), for: .touchUpInside)
        self.view.addSubview(self.addOneButton)
    }
    func setRemoveOneButton(){
           self.removeOneButton = defaultref.defButton(withText: "-", andButtonColor: .white)
           self.removeOneButton.layer.borderWidth = 1.2
           self.removeOneButton.setTitleColor(labelColor, for: .normal)
           self.removeOneButton.layer.borderColor = labelColor.cgColor
           self.removeOneButton.frame = CGRect(x: screenWith - 70, y: 430, width: 50, height: 30)
            self.removeOneButton.addTarget(self, action: #selector(removeItem), for: .touchUpInside)
            self.view.addSubview(self.removeOneButton)
    }
   func setAdd2CartButton(){
            self.add2Cart = defaultref.defButton(withText: "Add to Cart", andButtonColor: labelColor)
            self.add2Cart.setTitleColor(.white, for: .normal)
            self.add2Cart.frame = CGRect(x: 20, y: screenHeigth - 70, width: screenWith - 40, height: 50)
            CustomizeItems.referance.roundedButton25(with: self.add2Cart)
            self.add2Cart.addTarget(self, action: #selector(add2CartButtonTapped), for: .touchUpInside)
             self.view.addSubview(self.add2Cart)
    }
    func setTotalLabel(){
        self.totalLabel = defaultref.defLabel(withText: "Total : ", andLabelColor: labelColor)
        self.totalLabel.font = UIFont(name: "Helvetica", size: 40.0)
        self.totalLabel.textAlignment = .left
        self.totalLabel.frame = CGRect(x: 20, y: screenHeigth - 120, width: screenWith - 170, height: 40)
        self.view.addSubview(self.totalLabel)
    }
    func setTotal(){
        self.total = defaultref.defLabel(withText: "\(self.viewModel.totalCount)", andLabelColor: labelColor)
        self.total.font = UIFont(name: "Helvetica", size: 40.0)
        self.total.textAlignment = .right
        self.total.frame = CGRect(x: screenWith - 170, y: screenHeigth - 120, width: 150, height: 40)
        self.view.addSubview(self.total)
    }
    func setCount(){
           self.count = defaultref.defLabel(withText: "x \(self.viewModel.totalCount)", andLabelColor: labelColor)
           self.count.font = UIFont(name: "Helvetica", size: 20.0)
           self.count.textAlignment = .left
           self.count.frame = CGRect(x: screenWith - 110, y: 415, width: 40, height: 30)
           self.view.addSubview(self.count)
    }
    @objc func addItem(){
        self.viewModel.addItem()
    }
    @objc func removeItem(){
        self.viewModel.removeItem()
    }
    @objc func add2CartButtonTapped(){
        self.viewModel.add2Cart(self.viewModel.coffie, count: self.viewModel.totalCount.value, totalPrice: self.viewModel.totalCount.value * self.viewModel.coffie.price)
        
        let alert = UIAlertController(title: "Info", message: "This product has been added your bucket", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert,animated: true,completion: nil)
    }
    
}
extension CoffieDetailVC {
    func set(_ coffie :Coffes){
        self.viewModel.coffie = coffie
    }
}
