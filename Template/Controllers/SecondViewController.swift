//
//  SecondViewController.swift
//  Template
//
//  Created by Mac on 28.04.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class SecondViewController: UIViewController {
//    private var btn = DefaultItems.referance.defButton(withText: "Özgür", andButtonColor: .blue)
//    private var btn1 = DefaultItems.referance.defButton(withText: "Özge", andButtonColor: .green)
    let viewModel = SecondViewModel()
    let bag = DisposeBag()
    let referance = DefaultItems.referance
    private lazy var usernameTextField = UITextField()
    private lazy var passwordTextField = UITextField()
    private lazy var loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
//        self.btn.frame = Frames.init(width: 100, height: 50).leftTopItem
//        self.btn1.frame = Frames.init(width: 100, height: 50).rightTopItem
//        btn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
//        btn1.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
//        self.view.addSubview(btn)
//        self.view.addSubview(btn1)
        self.setUserNameTextField()
        self.setPasswordTextfield()
        self.setButton()
        self.viewModel.isValid().bind(to: self.loginButton.rx.isEnabled).disposed(by: bag)
        self.viewModel.isValid().map{$0 ?  1 : 0.1}.bind(to: self.loginButton.rx.alpha).disposed(by: bag)
        self.viewModel.isValid().map{$0 ? UIColor.green : UIColor.red}.bind(to: self.loginButton.rx.backgroundColor).disposed(by: bag)
        self.viewModel.isEmailAddressIsReal().asObservable().map{$0 ? "Save" : "Write normal value"}.bind(to: self.loginButton.rx.title()).disposed(by: bag)
        self.viewModel.rxValue.asObservable().map{
             UIColor(red: CGFloat($0), green: CGFloat($0), blue: CGFloat($0), alpha: 1)
            }.bind(to: self.view.rx.backgroundColor).disposed(by: bag)
//        self.viewModel.isEmailAddressIsReal().asObservable().subscribe(onNext: { (isvalid) in
//            isvalid != false ? self.loginButton.setTitle("Save", for: .normal) : self.loginButton.setTitle("Write normal email", for: .normal)
        // ysrın bunu basic coffe shop uygulmasına dönüştürelim !!!!!
//        }).disposed(by: bag)
    }
    func setUserNameTextField(){
        self.usernameTextField = referance.defTextField(withPlaceHolder: "Username", andHolderColor: .black)
        self.usernameTextField.frame = CGRect(x: 20, y: (screenHeigth / 2 )  - 50, width: screenWith - 40, height: 50)
        self.view.addSubview(self.usernameTextField)
        
        self.usernameTextField.rx.text.map{ $0 ?? ""}.bind(to: self.viewModel.usernameTextFieldPublish).disposed(by: bag)
    }
    func setPasswordTextfield(){
        self.passwordTextField = referance.defTextField(withPlaceHolder: "Password", andHolderColor: .black)
        self.passwordTextField.frame = CGRect(x: 20, y: (screenHeigth / 2 )  + 10, width: screenWith - 40, height: 50)
        self.view.addSubview(self.passwordTextField)
        
        self.passwordTextField.rx.text.map{ $0 ?? "" }.bind(to: self.viewModel.passwordTextFieldPublish).disposed(by: bag)
    }
    func setButton(){
        self.loginButton = referance.defButton(withText: "Save", andButtonColor: .red)
        self.loginButton.frame = CGRect(x: 20, y: (screenHeigth / 2 )  + 70, width: screenWith - 40, height: 50)
        self.loginButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        self.view.addSubview(self.loginButton)
    }
    @objc func tap(){
        self.viewModel.plusOne()
     }
}
class SecondViewModel {
    let usernameTextFieldPublish = PublishSubject<String>()
    let passwordTextFieldPublish = PublishSubject<String>()
    let rxValue = Variable(0)
    func plusOne(){
        rxValue.value = rxValue.value + 1
    }
    func isEmailAddressIsReal()->Observable<Bool>{
        return self.usernameTextFieldPublish.asObserver().map { (email)  in
            return email.contains("@")
        }
    }
    func isValid()->Observable<Bool>{
        return Observable.combineLatest(usernameTextFieldPublish.asObserver(), passwordTextFieldPublish.asObserver()).map { (username,password) in
                return username.count > 4 && password.count > 4
        }
    }
}

//Published Object : Subscribe olduktan sonraki yeni öğeleri yayar yani abone olunduktan sonra çalışır
//BehaviorSubject : Bu nesnede PublishSubject ile benzer yapıdadır. Ancak başlangıç olarak bir değer alır ve o değerden sonrasına nesneleri ekler
//ReplaySubject:  Bu nesnenin özelliği tampon bir buffer değeri girmeniz ve bu değere göre nesnenin yayılması durumudur. Aşağıdaki örneği inceleyebilirsiniz



//    @objc func buttonTapped(sender: UIButton){
//        guard let title = sender.titleLabel?.text else {return}
//        if title == "Özgür"{
//            let p = Person(n: title, s: "elmaslı", e: "email.cg")
//            selectedButtonVariable.value.append(p)
//        }else {
//            self.navigationController?.popViewController(animated: true)
//        }
//    }
//public struct Person{
//    private var name : String = ""
//    public var surname : String = ""
//    public var email :String = ""
//    init() {}
//    init(n:String , s : String , e : String) {
//        self.name = n
//        self.surname = s
//        self.email = e
//     }
//    func toString()->String{
//        return self.name + " " +   self.surname + " " + self.email
//    }
//}
