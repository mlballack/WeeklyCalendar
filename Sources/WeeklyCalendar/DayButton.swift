//
//  DayButton.swift
//  HabitVisualizer
//
//  Created by 林 政樹 on 2023/11/20.
//

import SwiftUI

struct DayButton: View {
    @State var selectedDate: Date = .now
    
    public var date: Date
    public var onTap: ((_ date: Date) -> Void)?
    public var isSelected: Bool = false
    
    private let theme = AppTheme()
    private var isToday: Bool {
        Calendar.current.isDateInToday(date)
    }
    
    private var textColor: Color {
        if isSelected { return theme.selectedTextColor }
        if isToday { return theme.todayTextColor }
        
        if Calendar.current.isDateInWeekend(date) {
            return theme.weekendTextColor
        }
        
        return theme.weekdayTextColor
    }
    
    private var textFont: Font {
        .system(size: 15, weight: isSelected ? .semibold : .regular)
    }
    
    private var bgColor: Color {
        if isSelected {
            return isToday ? theme.todaySelectedCircleColor : theme.selectedCircleColor
        }
        return .clear
    }
    
    var body: some View {
        Button {
            onTap?(self.date)
        } label: {
            VStack {
                VStack {
                    Text(date.string("dd"))
                        .foregroundStyle(textColor)
                        .font(textFont)
                }
            }
            .padding(8)
            .background(bgColor)
            .clipShape(Circle())
        }
    }
}

extension DayButton {
    public func onTap( _ action: @escaping (_ date: Date) -> Void) -> Self {
        var copy = self
        copy.onTap = action
        return copy
    }
}
