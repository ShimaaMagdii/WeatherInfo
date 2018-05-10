//
//  Utilities.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/10/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//
import UIKit
import SwiftMessages


class Utilities: NSObject {
    
    static let hide = "Hide"
    
    class func showErrorNudge(WithError errorMsg :String) {
        let error = MessageView.viewFromNib(layout: .messageView)
        error.configureDropShadow()
        error.configureTheme(.error)
        error.configureContent(title: nil, body: errorMsg, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: Utilities.hide) { (btn) in
            SwiftMessages.hide()
        }
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)
        config.duration = .seconds(seconds: 5)
        config.dimMode = .gray(interactive: true)
        config.interactiveHide = true
        config.preferredStatusBarStyle = .lightContent
        config.eventListeners.append() { event in
            if case .didHide = event {
            }
        }
        SwiftMessages.show(config: config, view: error)
    }
    
    class func showWarningNudge(WithMsg Msg :String) {
        let warning = MessageView.viewFromNib(layout: .messageView)
        warning.configureTheme(.warning)
        warning.configureDropShadow()
        warning.configureContent(title: "Warning", body: Msg)
        warning.button?.isHidden = true
        var warningConfig = SwiftMessages.defaultConfig
        warningConfig.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)
        SwiftMessages.show(config: warningConfig, view: warning)
    }
    
    class func showSuccessMsg(WithMsg Msg :String){
        let success = MessageView.viewFromNib(layout: .cardView)
        success.configureTheme(.success)
        success.configureDropShadow()
        success.configureContent(title: "Success", body: Msg)
        success.button?.isHidden = true
        var successConfig = SwiftMessages.defaultConfig
        successConfig.presentationStyle = .center
        successConfig.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        SwiftMessages.show(config: successConfig, view: success)
    }
    
   
    
}
