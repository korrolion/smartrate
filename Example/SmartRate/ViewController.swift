//
//  ViewController.swift
//  SmartRate
//
//  Created by korrolion on 07/17/2017.
//  Copyright (c) 2017 korrolion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    static let breakNotificationName = Notification.Name("breakNotification")
    
    static let step1NotificationName = Notification.Name("step1Notification")
    static let step2NotificationName = Notification.Name("step2Notification")
    static let step3NotificationName = Notification.Name("step3Notification")
    
    static let duplicateActionNotificationName = NSNotification.Name("duplicateActionNotification")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction private func breakAction() {
        NotificationCenter.default.post(Notification(name: ViewController.breakNotificationName))
    }
    
    @IBAction private func step1Action() {
        NotificationCenter.default.post(Notification(name: ViewController.step1NotificationName))
    }
    
    @IBAction private func step2Action() {
        NotificationCenter.default.post(Notification(name: ViewController.step2NotificationName))
    }
    
    @IBAction private func step3Action() {
        NotificationCenter.default.post(Notification(name: ViewController.step3NotificationName))
    }
    
    @IBAction private func pressAction() {
        NotificationCenter.default.post(Notification(name: ViewController.duplicateActionNotificationName))
    }

}

