//
//  AppDelegate.swift
//  SmartRate
//
//  Created by korrolion on 07/17/2017.
//  Copyright (c) 2017 korrolion. All rights reserved.
//

import UIKit
import SmartRate
import StoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
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
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

