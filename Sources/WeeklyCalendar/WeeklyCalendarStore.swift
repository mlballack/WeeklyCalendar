//
//  WeeklyCalendarStore.swift
//  HabitVisualizer
//
//  Created by 林 政樹 on 2023/11/20.
//

import SwiftUI

class WeeklyCalendarStore: ObservableObject {
    @Published public var indexArray: [Int] = []
    @Published public var selectedIndex: Int = 0
    public var selectedWeek: [Date] {
        return weekArray[selectedIndex + lastIndex]
    }
    
    private var weekArray: [[Date]] = [[]]
    private var lastIndex: Int {
        indexArray.last!
    }
    private var firstIndex: Int {
        indexArray.first!
    }
    
    init() {
        indexArray = (-2...2).map({$0})
        weekArray = indexArray.map({ idx in
            let now = Date.now
            if idx == 0 {
                return weekDates(of: now)
            }
            else {
                return moveWeek(of: now, to: idx)
            }
        })
    }
    
    func update(index: Int) {
        if index == lastIndex || index == firstIndex { return }
        if selectedIndex == lastIndex {
            moveNextWeekDates()
            selectedIndex = firstIndex + 1
        } else if selectedIndex == firstIndex {
            movePreviousWeekDates()
            selectedIndex = lastIndex - 1
        }
    }
    
    func getWeekData(index: Int) -> [Date] {
        let idx = index + lastIndex
        if idx >= weekArray.count { return [] }
        return weekArray[index + lastIndex]
    }
    
    func moveWeek(of date: Date, to: Int) -> [Date] {
        guard
            let moved = moveDay(of: date, to: 7 * to)
        else {
            return []
        }
        return weekDates(of: moved)
    }
    
    func moveWeek(ofWeek week:[Date], to: Int) -> [Date] {
        guard
            let date = week.first,
            let moved = moveDay(of: date, to: 7 * to)
        else { return [] }
        return weekDates(of: moved)
    }
    
    func moveNextWeekDates() {
        let lastIdx = self.weekArray.count - 1
        let firstEle = weekArray[lastIdx - 1]
        weekArray = (0...lastIdx).map({
            moveWeek(ofWeek: firstEle, to: $0)
        })
    }

    func movePreviousWeekDates() {
        let lastIdx = self.weekArray.count - 1
        let firstEle = weekArray[1]
        weekArray = (-lastIdx...0).map({
            moveWeek(ofWeek: firstEle, to: $0)
        })
    }
    
    func firstDateOfWeek(of date: Date) -> Date? {
        Calendar.current.dateInterval(of: .weekOfMonth, for: date)?.start
    }
    
    func weekDates(of date: Date) -> [Date] {
        guard let selected = firstDateOfWeek(of: date) else {
            return [] }
        let values = (0...6).map({
            Calendar.current.date(byAdding: .day, value: $0, to: selected )
        })
        .compactMap({ $0 })

        if values.count < 7 {
            return [] }
        
        return values
    }
    
    func moveDay(of date: Date, to: Int) -> Date? {
        Calendar.current.date(byAdding: .day, value: to, to: date )
    }
}
