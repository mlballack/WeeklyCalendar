//
//  AppTheme.swift
//  HabitVisualizer
//
//  Created by 林 政樹 on 2023/11/20.
//

import SwiftUI

struct AppTheme {
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
        }
    }
    
    enum Theme {
        case light
        case dark
        case cyberpunk
    }
}
