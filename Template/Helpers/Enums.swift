//
//  Enums.swift
//  Template
//
//  Created by Mac on 7.04.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
// ENUMLAR
enum PageType {
    case FirstScreen
    case Anasayfa
    case PlusVC
    case ProfileVC
}
enum PhoneType {
    case iPhoneXR
    case iPhoneX
    case iPhoneXSMax
    case iPhone8Plus
    case iPhone8
    case iPhoneSE
    case Hata
}
enum CustomShapes{
    case Circle
    case Rectangle
    case Triangle
    case diamond
    case Custom
}
enum OwnRequestType :String {
    case GET = "GET"
    case PUT = "PUT"
    case DELETE = "DELETE"
    case POST = "POST"
}
enum LoginScreen {
    case Login
    case CreateUser
}
enum Side {
    case Left
    case Top
    case Bottom
    case Right
}
