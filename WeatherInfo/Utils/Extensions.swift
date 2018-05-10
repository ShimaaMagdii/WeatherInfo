//
//  Extensions.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/10/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import UIKit


extension Dictionary {
    mutating func update(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}
extension String {
    
    func getDateWithformat (dataFormat:String ) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  dataFormat //Your date format
        dateFormatter.timeZone =  TimeZone.current
        
        let date:Date = dateFormatter.date(from: self)! //according to date format your date string
        return date
    }
}

extension UIColor {
    static let navColor = UIColor.init(red: 55/255, green: 59/255, blue: 56/255, alpha: 1)
    static let titleColor = UIColor.init(red: 255/255, green: 211/255, blue: 128/255, alpha: 1)
    static let greenThemeColor = UIColor.init(red: 0/255, green: 109/255, blue: 105/255, alpha: 1)
    static let seperatorColor = UIColor.init(red: 42/255, green: 48/255, blue: 44/255, alpha: 1)
    static let asteriskColor = UIColor.init(red: 154/255, green: 116/255, blue: 42/255, alpha: 1)
    static let brownColor  =  UIColor.init(red: 227/255, green: 221/255, blue: 211/255, alpha: 1)
    static let progressColor = UIColor(red: 154/255, green: 116/255, blue: 42/255, alpha: 1)
    static let completeProgressColor =  UIColor(red: 10/255, green: 123/255, blue: 39/255, alpha: 1)
}

extension UIView {
    func dropCardShadow(radius: CGFloat = 1, opacity: Float = 2 , shadowColor:UIColor = UIColor.black){
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: 0, height:  radius)
        self.layer.shadowRadius =  radius
    }
   
    func addCornerRadius(cornerRadius: CGFloat = 5){
        self.layer.cornerRadius = cornerRadius
    }
    
}

extension UIScrollView {
    func scrollToBottom(animated: Bool) {
        if self.contentSize.height < self.bounds.size.height { return }
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(bottomOffset, animated: animated)
    }
}
