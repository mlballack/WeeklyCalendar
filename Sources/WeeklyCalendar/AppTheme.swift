//
//  AppTheme.swift
//  HabitVisualizer
//
//  Created by 林 政樹 on 2023/11/20.
//

import SwiftUI
#if !os(macOS)
public struct AppTheme {
    private var theme: Theme = .light
    
    public mutating func set(_ theme: Theme) {
        self.theme = theme
    }
    
    public var bgColor: Color {
        switch theme {
        case .light:
            return Color(uiColor: .systemGroupedBackground)
        case .dark:
            return Color(uiColor: .darkGray)
        case .cyberpunk:
            return .black
        case .custom(bgColor: let color, weekdayTextColor: _, weekendTextColor: _, todayTextColor: _, selectedTextColor: _ , selectedCircleColor: _, todaySelectedCircleColor: _, dateTextColor: _):
            return color
        }
    }
    
    public var weekdayTextColor: Color {
        switch theme {
        case .light:
            return .black
        case .dark:
            return .white
        case .cyberpunk:
            return .green
        case .custom(bgColor: _, weekdayTextColor: let color, weekendTextColor: _, todayTextColor: _, selectedTextColor: _ , selectedCircleColor: _, todaySelectedCircleColor: _, dateTextColor: _):
            return color
        }
    }
    
    public var weekendTextColor: Color {
        switch theme {
        case .light:
            return Color(uiColor: .lightGray)
        case .dark:
            return Color(uiColor: .lightGray)
        case .cyberpunk:
            return .green.opacity(0.6)
        case .custom(bgColor: _, weekdayTextColor: _, weekendTextColor: let color, todayTextColor: _, selectedTextColor: _ , selectedCircleColor: _, todaySelectedCircleColor: _, dateTextColor: _):
            return color
        }
    }
    
    public var todayTextColor: Color {
        switch theme {
        case .light:
            return .red
        case .dark:
            return .red
        case .cyberpunk:
            return .white
        case .custom(bgColor: _, weekdayTextColor: _, weekendTextColor: _, todayTextColor: let color, selectedTextColor: _ , selectedCircleColor: _, todaySelectedCircleColor: _, dateTextColor: _):
            return color
        }
    }
    
    public var selectedTextColor: Color {
        switch theme {
        case .light:
            return .white
        case .dark:
            return .black
        case .cyberpunk:
            return .green
        case .custom(bgColor: _, weekdayTextColor: _, weekendTextColor: _, todayTextColor: _, selectedTextColor: let color, selectedCircleColor: _, todaySelectedCircleColor: _, dateTextColor: _):
            return color
        }
    }
    
    public var selectedCircleColor: Color {
        switch theme {
        case .light:
            return .black
        case .dark:
            return .white
        case .cyberpunk:
            return .white
        case .custom(bgColor: _, weekdayTextColor: _, weekendTextColor: _, todayTextColor: _, selectedTextColor: _ , selectedCircleColor: let color, todaySelectedCircleColor: _, dateTextColor: _):
            return color
        }
    }
    
    public var todaySelectedCircleColor: Color {
        switch theme {
        case .light:
            return .red
        case .dark:
            return .red
        case .cyberpunk:
            return .white
        case .custom(bgColor: _, weekdayTextColor: _, weekendTextColor: _, todayTextColor: _, selectedTextColor: _ , selectedCircleColor: _, todaySelectedCircleColor: let color, dateTextColor: _):
            return color
        }
    }
    
    public var dateTextColor: Color {
        switch theme {
        case .light:
            return .black
        case .dark:
            return .white
        case .cyberpunk:
            return .green
        case .custom(bgColor: _, weekdayTextColor: _, weekendTextColor: _, todayTextColor: _, selectedTextColor: _ , selectedCircleColor: _, todaySelectedCircleColor: _, dateTextColor: let color):
            return color
        }
    }
    
    public enum Theme {
        case light
        case dark
        case cyberpunk
        case custom(bgColor: Color = .white,
                    weekdayTextColor: Color = .white,
                    weekendTextColor: Color = .white,
                    todayTextColor: Color = .white,
                    selectedTextColor: Color = .white,
                    selectedCircleColor: Color = .white,
                    todaySelectedCircleColor: Color = .white,
                    dateTextColor: Color = .white
        )
    }
}
#endif
