//
//  File.swift
//  
//
//  Created by 林 政樹 on 2023/11/20.
//

import Foundation

extension Date {
    func string(_ format: String = kDateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        
        return formatter.string(from: self)
    }

}
