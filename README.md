# WeeklyCalendar
[![Platforms](https://img.shields.io/badge/platform-iOS-blue.svg?style=flat)](https://github.com/mlballack/WeeklyCalendar/)
[![Swift](https://img.shields.io/badge/Swift-5-orange.svg)](https://github.com/mlballack/WeeklyCalendar/)
[![License](https://img.shields.io/github/license/mlballack/WeeklyCalendar)](https://github.com/mlballack/WeeklyCalendar/blob/main/LICENSE.md)
[![Twitter](https://img.shields.io/twitter/follow/mh_poteto?style=social)](https://twitter.com/mh_poteto)

WeeklyCalendar is an week display calendar view in SwiftUI emulating iPhone's Calendar app UI.

<img src="https://github.com/mlballack/WeeklyCalendar/assets/77086210/af24f842-da0e-41cd-9da5-9ec3eab4d5dd" width="300" alt="light mode git"/>

## Color type 
<img src="https://github.com/mlballack/WeeklyCalendar/assets/77086210/8a9aca0d-2dab-4946-9af8-19d2dbbb1108" width="300" alt="light mode"/>
<img src="https://github.com/mlballack/WeeklyCalendar/assets/77086210/8eba7166-473b-49b5-84e0-d2633781b905" width="300" alt="dark mode"/>

## Table of Contents

- [Installation](#installation)
- [How to use](#how-to-use)
- [Requirements](#requirements)
- [Contribution](#contribution)
- [Stats](#stats)
- [License](#license)

## Installation

### Swift Package Manager

#### Package

You can add this package to `Package.swift`, include it in your target dependencies.

```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/mlballack/WeeklyCalendar", .upToNextMajor(from: "0.1.0")),
    ],
    targets: [
        .target(
            name: "<your-target-name>",
            dependencies: ["WeeklyCalendar"]),
    ]
)
```

#### Xcode

You can add this package on Xcode.
See [documentation](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app).

## How to use

You can just import `WeeklyCalendar` to use it.

```swift
import SwiftUI
import WeeklyCalendar

struct ContentView: View {
    @State var selectedDate: Date = .now
    
    var body: some View {
        VStack {
            WeeklyCalendar()
                .setColorTheme(.dark)
                .onChangeDate { selected in
                    selectedDate = selected
                }
            // Any View
        }
    }
}
```

and if you want to choose your own colors, you can customize it as follows

```swift
WeeklyCalendar()
    .setColorTheme(.custom(
        bgColor: <#T##Color#>,
        weekdayTextColor: <#T##Color#>,
        weekendTextColor: <#T##Color#>,
        todayTextColor: <#T##Color#>,
        selectedTextColor: <#T##Color#>,
        selectedCircleColor: <#T##Color#>,
        todaySelectedCircleColor: <#T##Color#>,
        dateTextColor: <#T##Color#>
    ))
```

## Requirements

- iOS 16.0+
- Xcode 14.0+

## Contribution

I would be happy if you contribute !!

- [New issue](https://github.com/mlballack/WeeklyCalendar/issues/new)
- [New pull request](https://github.com/mlballack/WeeklyCalendar/compare)

## Stats

[![Stats](https://repobeats.axiom.co/api/embed/3b9229c64d59197051a610e702ffb2cc822db648.svg "Repobeats analytics image")](https://github.com/mlballack/WeeklyCalendar)

## License
This project is licensed under the MIT License - see the LICENSE file for details
