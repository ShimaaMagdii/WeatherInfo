//
//  BaseService.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/10/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation
import MBProgressHUD

class BaseService {
    
    func showLoading() {
        if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
            MBProgressHUD.showAdded(to: rootVC.view, animated: true)
        }
    }
    
    func hideLoading() {
        if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
            MBProgressHUD.hide(for: rootVC.view, animated: true)
        }
    }
    
    func showWarningMsg(_ msg: String){
        Utilities.showWarningNudge(WithMsg: msg)
    }
    
    func handelError (error: NSError){
        self.hideLoading()
        Utilities.showErrorNudge(WithError: error.localizedDescription)
    }
}
