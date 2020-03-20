//
//  SMTriggerChainType.swift
//  Pods
//
//  Created by Igor Korolev on 17.07.17.
//
//  Will fire after sequence of events

import Foundation

public class SMTriggerChainType: SMTrigger {
    
    //MARK: - Public
    
    public init(notificationNames: [NSNotification.Name], breakNotificationName: NSNotification.Name?, uniqName: String) {
        self.notificationNames = notificationNames
        self.counter = SMEventsCounter(key: uniqName)
        self.breakNotificationName = breakNotificationName
        
        super.init()
        
        startObserving()
    }
    
    //MARK: - Private
    
    private var notificationNames: [NSNotification.Name]
    
    private var breakNotificationName: NSNotification.Name?
    
    private var counter: SMEventsCounter
    
    private var currentStep: Int = 0
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func startObserving() {
        if let breakNotificationName = breakNotificationName {
            NotificationCenter.default.addObserver(self, selector: #selector(SMTriggerChainType.handleBreakNotification(_:)), name: breakNotificationName, object: nil)
        }
        
        for notificationName in notificationNames {
            NotificationCenter.default.addObserver(self, selector: #selector(SMTriggerChainType.handleNotification(_:)), name: notificationName, object: nil)
        }
    }
    
    @objc private dynamic func handleNotification(_ notification: Notification) {
        let stepNumber = stepNumberFor(notification: notification)
        if stepNumber == 0 { return }
        
        if counter.value == stepNumber - 1 {
            //Correct step
            if counter.increment() == notificationNames.count {
                _ = fire()
                counter.reset()
            }
        } else {
            //Wrong step
            counter.reset()
            if stepNumber == 1 {
                counter.value = 1
            }
        }
    }
    
    @objc private dynamic func handleBreakNotification(_ notification: Notification) {
        counter.reset()
    }
    
    private func stepNumberFor(notification: Notification) -> Int {
        var i = 0
        for notificationName in notificationNames {
            i += 1
            if notification.name == notificationName {
                return i
            }
        }
        return 0
    }
    
}
