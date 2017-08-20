# ANLoader

Create loading view with just a single lines of code.

[![CI Status](http://img.shields.io/travis/anscoder/ANLoader.svg?style=flat)](https://travis-ci.org/anscoder/ANLoader)
[![Version](https://img.shields.io/cocoapods/v/ANLoader.svg?style=flat)](http://cocoapods.org/pods/ANLoader)
[![License](https://img.shields.io/cocoapods/l/ANLoader.svg?style=flat)](http://cocoapods.org/pods/ANLoader)
[![Platform](https://img.shields.io/cocoapods/p/ANLoader.svg?style=flat)](http://cocoapods.org/pods/ANLoader)
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift3-compatible-orange.svg?style=flat" alt="Swift 3 compatible" /></a>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![demo](https://raw.githubusercontent.com/ANSCoder/ANLoader/master/Images/Loading.gif)


## How to start loading:
```swift
ANLoader.showLoading("Loading", disableUI: true)
```
'disableUI' stops user interactions until you hide loadingactivity.  

or user directly without disable UI.

```swift
ANLoader.showLoading()
```

## How to dismiss loading:
```swift
ANLoader.hide()
```

##Custom Settings

```swift
ANLoader.activityColor = .darkGray
ANLoader.activityBackgroundColor = .clear
ANLoader.activityTextColor = .clear
```

## Requirements

Deployment target of your App is >= iOS 9.0

## Installation

ANLoader is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ANLoader"
```

## Author

anscoder, nimjea@gmail.com

## License

ANLoader is available under the MIT license. See the LICENSE file for more info.
