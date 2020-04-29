//
//  GeneralFunctions.swift
//  Template
//
//  Created by Mac on 7.04.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit
//import NVActivityIndicatorView

func getDeviceModel() -> PhoneType {
    guard let appDel = UIApplication.shared.delegate as? AppDelegate else {fatalError("error")}
    let deviceModel : PhoneType = appDel.deviceModel()
    return deviceModel
}
func getLastViewController()-> UIViewController{
    guard let appDel = UIApplication.shared.delegate as? AppDelegate else {fatalError()}
    if let lastViewController = appDel.window?.rootViewController?.children.last{
        return lastViewController
    }
    return UIViewController()
}
//func getCustomLoader() -> NVActivityIndicatorView{
//     let loader = NVActivityIndicatorView(frame: CGRect(x:(screenWith / 2) - 50, y: (screenHeigth / 2) - 50, width: 100, height: 100), type: .orbit, color: buttoncolor, padding: 0)
//    return loader
//}
func getUserName()->String {
    if let username = UserDefaults.standard.string(forKey: "username"){
        return username
    }
    return ""
}
func setUserDefaultsString(withValue:Any,forKey:String){
    UserDefaults.standard.setValue(withValue, forKey: forKey)
    UserDefaults.standard.synchronize()
}
func removeUserDefaultString(forkey:String){
    UserDefaults.standard.removeObject(forKey: forkey)
    UserDefaults.standard.synchronize()
}
