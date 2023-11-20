# WeeklyCalendar

[![License](https://img.shields.io/github/license/mlballack/WeeklyCalendar)](https://github.com/mlballack/WeeklyCalendar/blob/main/LICENSE)
[![Twitter](https://img.shields.io/twitter/follow/mh_poteto?style=social)](https://twitter.com/mh_poteto)

WeeklyCalendar

## Table of Contents

- [Installation](#installation)
- [How to use](#how-to-use)
- [Contribution](#contribution)
- [Stats](#stats)

## Installation

### Swift Package Manager (Recommended)

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
import WeeklyCalendar
```

## Contribution

I would be happy if you contribute :)

- [New issue](https://github.com/mlballack/WeeklyCalendar/issues/new)
- [New pull request](https://github.com/mlballack/WeeklyCalendar/compare)

## Stats

[![Stats](https://repobeats.axiom.co/api/embed/3b9229c64d59197051a610e702ffb2cc822db648.svg "Repobeats analytics image")](https://github.com/mlballack/WeeklyCalendar)
