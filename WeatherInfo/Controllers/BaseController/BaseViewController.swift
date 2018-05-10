//
//  BaseViewController.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/10/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import UIKit
import SwiftMessages

enum MessageType {
    case Alert
    case Error
    case Warning
    case Success
}

protocol BaseViewControllerViewProtocol: class {
    func showMessage(WithType type: MessageType?, andMsg msg: String)
}

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension BaseViewController : BaseViewControllerViewProtocol {
    
    func showMessage(WithType type: MessageType?, andMsg msg: String) {
        if let msgtype = type {
            switch msgtype {
            case .Error:
                Utilities.showErrorNudge(WithError: msg)
                break
            case .Warning:
                Utilities.showWarningNudge(WithMsg: msg)
                break
            case .Success:
                Utilities.showSuccessMsg(WithMsg: msg)
                break
            default:
                self.showAlert(withTitle: nil, message: msg)
            }
        }
        else{
            self.showAlert(withTitle: nil, message: msg)
        }
        
    }
}

// MARK: Helper Extensions
extension UIViewController {
    func showAlert(withTitle title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(withTitle title: String?, message: String?, withCustomHandler handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: handler)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

