//
//  File.swift
//  
//
//  Created by 林 政樹 on 2023/11/20.
//

import Foundation

let kDateFormat = "yyyyMMdd"

extension String {
    func date(_ format: String = kDateFormat) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        
        return formatter.date(from: self)
    }

}
