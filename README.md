# ANLoader

👾 Create loading view with just a single lines of code. ⛳️

[![Build Status](https://travis-ci.com/ANSCoder/ANLoader.svg?branch=master)](https://travis-ci.com/ANSCoder/ANLoader)
[![Version](https://img.shields.io/cocoapods/v/ANLoader.svg?style=flat)](http://cocoapods.org/pods/ANLoader)
[![License](https://img.shields.io/cocoapods/l/ANLoader.svg?style=flat)](http://cocoapods.org/pods/ANLoader)
[![Platform](https://img.shields.io/cocoapods/p/ANLoader.svg?style=flat)](http://cocoapods.org/pods/ANLoader)
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift4.2-compatible-orange.svg?style=flat" alt="Swift 5.0 compatible" /></a>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first. 🎉


![](https://raw.githubusercontent.com/ANSCoder/ANLoader/master/Example/ANLoader/Images.xcassets/Sticker%20Pack.stickerpack/Loading.sticker/Loading.gif)


### 🛠 How to start loading

By using a simple line create loading view. ☝🏻

```swift
ANLoader.showLoading("Loading", disableUI: true)
```

By choosing 'disableUI' stops user interactions until you hide loading Activity. 🙌

### ⚡️ Use directly without disable UI

```swift
ANLoader.showLoading()
```

### 🖐🏻 How to dismiss loading

No need to call other extra things it will be manage automatically. 👏🏻

```swift
ANLoader.hide()
```

### 📝 Custom Settings

Easy to make changes by choosing options 🔧

```swift
ANLoader.pulseAnimation = true //It will animate your Loading
ANLoader.activityColor = .darkGray
ANLoader.activityBackgroundColor = .clear
ANLoader.activityTextColor = .clear

```
![](https://github.com/ANSCoder/ANLoader/blob/master/Example/ANLoader/Images.xcassets/loading.imageset/loading.png)

#### Note : - Please keep in mind activityColor and activityBackgroundColor should be different.Otherwise you can manage by your self. Add custom settings in the AppDelegate class.

## 🤔 Requirements

* Deployment target of your App is >= iOS 10.2
* Xcode 10+

## 💻 Installation

ANLoader is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ANLoader', :git => 'https://github.com/ANSCoder/ANLoader.git'
```

### Swift Package Manager
```swift
dependencies: [
  .package(url: "https://github.com/ANSCoder/ANLoader.git", from: "2.0.0")
]
```
#### or

Manually drag and drop `ANLoader.swift` single file inside your project.

## 👤 Author

anscoder (Anand)

## 📄 License

ANLoader is available under the MIT license. See the [LICENSE](https://github.com/ANSCoder/ANLoader/blob/master/LICENSE) file for more info.
