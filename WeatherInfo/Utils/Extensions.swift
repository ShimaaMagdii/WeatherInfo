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

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}

extension UIColor {
    static let navColor = UIColor.init(red: 55/255, green: 59/255, blue: 56/255, alpha: 1)
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
