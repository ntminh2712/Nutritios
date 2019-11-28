//
//  Define.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
struct SegueIdentifier {
    //Explore
    static let HomeView = "HomeView"
    static let CategoryView = "CategoryView"
    static let HistoryView = "HistoryView"
    static let ProfileView = "ProfileView"
}

struct ControllerIdentifier {
    //Login
    static let navigationLogin = "navigationLogin"
    
}

enum HandlerPlay:String {
    case nextMusic = "nextMusic"
    case previousMusic = "previousMusic"
    case playMusic = "playMusic"
    case hiddenPlay = "hiddenPlay"
    case showPlay = "showPlay"
    case pauseMusic = "pauseMusic"
    case startAnimation = "startAnimation"
    case stopAnimation = "stopAnimation"
    var notification: NSNotification.Name{
        return Notification.Name(rawValue: self.rawValue)
    }
    
}
struct DateFormat {
    static let yyyyssDash = "yyyy-MM-dd'T'HH:mm:ss"
    static let ddmmSlash = "dd/MM/yyyy HH:mm"
    static let ddMMyyyy = "dd/MM/yyyy"
    static let MMyyyy = "MM/yyyy"
    static let yyyyMMdd = "yyyy/MM/dd"
    static let yyyymsDash = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    static let yyyymsZDash = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    static let HHmm = "HH:mm"
    static let slashddmmyy = "HH:mm dd/MM/yyyy"
    static let yyyymdHmsZ = "yyyy-MM-dd HH:mm:ss ZZZ"
    static let yyyyMdHms = "yyyy/MM/dd HH:mm:ss"
    static let ddMMMMyyyy = "dd MMMM','yyyy"
    static let yyyyMMddHHmmss = "yyyyMMddHHmmss"
}

enum notificationName: String {
    //Login
    case presentMenu = "showViewMenu"
    case presentCategoryDetailView = "showViewCategoryDetail"
    case presentCategory = "showViewCategory"
    case presentFavorites = "showViewFavorites"
    var notification: NSNotification.Name{
        return Notification.Name(rawValue: self.rawValue)
    }
}
enum RoundType {
    case top
    case none
    case bottom
    case both
}



struct CodeResponse  {
    public static var success: Int = 200
    public static var failure: Int = 400
}
