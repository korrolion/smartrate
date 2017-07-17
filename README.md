# SmartRate

This pod will help you to realize your complex logic of showing rating window.
You could set any sequence of actions.

```swift
//Configure SmartRate
SMBlocker.shared.minTimeAfterInstalled = 60 //Will not fire 60 seconds after first launch
SMBlocker.shared.minTimeAfterLaunch = 10 //Will not fire 10 seconds after launch
SMBlocker.shared.showRatingForEveryVersion = true //Will reset block if the app version will change

//Create triggers for SmartRate
let countTrigger = SMTriggerCounterType(notificationName: ViewController.duplicateActionNotificationName, repeatTimes: 4, uniqName: "press4TimesTrigger")
//For every trigger you can provide custom fire function, or use default
countTrigger.customFireCompletion = {
if #available(iOS 10.3, *) {
SKStoreReviewController.requestReview()
}
}
//Will fire on 4-th button press
SMTriggersStore.shared.addTrigger(countTrigger)

let chainTrigger = SMTriggerChainType(notificationNames: [
ViewController.step1NotificationName, //provide sequence of steps
ViewController.step2NotificationName,
ViewController.step3NotificationName,
],
breakNotificationName: ViewController.breakNotificationName, //You can break chain on any other action, or set nil
uniqName: "pressButtons123Trigger"
)
//Will fire after correct sequence of 3 steps. Will not fire if sequence will be broken
SMTriggersStore.shared.addTrigger(chainTrigger)
```


[![CI Status](http://img.shields.io/travis/korrolion/SmartRate.svg?style=flat)](https://travis-ci.org/korrolion/SmartRate)
[![Version](https://img.shields.io/cocoapods/v/SmartRate.svg?style=flat)](http://cocoapods.org/pods/SmartRate)
[![License](https://img.shields.io/cocoapods/l/SmartRate.svg?style=flat)](http://cocoapods.org/pods/SmartRate)
[![Platform](https://img.shields.io/cocoapods/p/SmartRate.svg?style=flat)](http://cocoapods.org/pods/SmartRate)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SmartRate is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SmartRate"
```

## License

SmartRate is available under the MIT license. See the LICENSE file for more info.
