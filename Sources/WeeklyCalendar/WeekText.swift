//
//  WeekText.swift
//  HabitVisualizer
//
//  Created by 林 政樹 on 2023/11/20.
//

import SwiftUI

struct WeekText: View {
    public var date: Date
    
    private let theme = AppTheme()
    private var name: String {
        date.string("EEE")
    }
    private var textColor: Color {
        if Calendar.current.isDateInWeekend(date) {
            return theme.weekendTextColor
        } else {
            return theme.weekdayTextColor
        }
    }
    
    var body: some View {
        Text(name)
            .font(.system(size: 12))
            .foregroundStyle(textColor)
    }
}
