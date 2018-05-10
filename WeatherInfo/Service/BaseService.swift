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
        // let view = UIApplication.shared.windows[0]
        if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
            MBProgressHUD.showAdded(to: rootVC.view, animated: true)
        }
    }
    
    func hideLoading() {
        if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
            MBProgressHUD.hide(for: rootVC.view, animated: true)
        }
    }
    
    func handelError (error: NSError){
        self.hideLoading()
        Utilities.showErrorNudge(WithError: error.localizedDescription)
    }
}
