// The Swift Programming Language
// https://docs.swift.org/swift-book

/*
 [References]
 [1] https://qiita.com/fumiyasac@github/items/b5b313d9807ff858a73c#2-draggesture%E3%82%92%E5%88%A9%E7%94%A8%E3%81%97%E3%81%9Fcarousel%E8%A1%A8%E7%8F%BE%E4%BE%8B%E3%81%AE%E3%81%94%E7%B4%B9%E4%BB%8B
 [2] https://zenn.dev/kyome/articles/11e3d3d143a3fa
 [3] https://stackoverflow.com/questions/73596603/use-tabview-to-implement-inifinite-scroll-like-the-weekview-of-calendar-app
 */

import SwiftUI

struct WeeklyCalendar: View {
    public var onChangeDate: ((_ date: Date) -> Void)?

    private var height: CGFloat = 90

    @StateObject private var store: WeeklyCalendarStore = WeeklyCalendarStore()
    @State private var selectedDate: Date = .now
    
    private var theme: AppTheme = AppTheme()
    
    private var calendarBgColor: Color {
        self.theme.bgColor
    }
    
    private var Weekbar: some View {
        HStack {
            ForEach(store.selectedWeek, id: \.self) { date in
                WeekText(date: date)
                    .frame(maxWidth: .infinity)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Weekbar

            TabView(selection: $store.selectedIndex) {
                ForEach(store.indexArray, id: \.self) { index in
                    VStack {
                        HStack {
                            ForEach(store.getWeekData(index: index), id: \.self) {date in
                                VStack {
                                    DayButton(date: date, isSelected: selectedDate.string("yyyyMMdd") == date.string("yyyyMMdd"))
                                        .onTap {
                                            selectedDate = $0
                                        }
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    .tag(index)
                    .onDisappear {
                        store.update(index: index)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onChange(of: store.selectedIndex) { _ in
                guard let newDate = store.selectedWeek.first(where: {
                    Calendar.current.component(.weekday, from: selectedDate) == Calendar.current.component(.weekday, from: $0)
                }) else { return }
                selectedDate = newDate
            }
            .onChange(of: selectedDate) { _ in onChangeDate?(selectedDate) }
            
            Text(selectedDate.string("yyyy/MM/dd(EEE)"))
                .frame(maxWidth: .infinity)
                .font(Font(UIFont.monospacedDigitSystemFont(ofSize: 14, weight: .regular)))
                .foregroundStyle(theme.dateTextColor)

        }
        .frame(height: height)
        .padding()
        .background(calendarBgColor)
    }
}

extension WeeklyCalendar {
    public func onChangeDate( _ action: @escaping (_ date: Date) -> Void) -> Self {
        var copy = self
        copy.onChangeDate = action
        return copy
    }
    
    public func setColorTheme(_ theme: AppTheme.Theme) -> Self {
        var copy = self
        copy.theme.set(theme)
        return copy
    }
}
