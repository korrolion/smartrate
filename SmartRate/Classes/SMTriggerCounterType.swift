//
//  SMTriggerCounterType.swift
//  Pods
//
//  Created by Igor Korolev on 17.07.17.
//
//  Should count one type of event and will fire after n times

import Foundation

public class SMTriggerCounterType: SMTrigger {
    
    //MARK: - Public
    
    public init(notificationName: NSNotification.Name, repeatTimes: Int, uniqName: String) {
        self.notificationName = notificationName
        self.counter = SMEventsCounter(key: uniqName)
        self.repeatTimes = repeatTimes
        
        super.init()
        
        startObserving()
    }
    
    //MARK: - Private
    
    private var notificationName: NSNotification.Name
    
    private var counter: SMEventsCounter
    
    private var observer: NSObjectProtocol?
    
    private var repeatTimes: Int
    
    deinit {
        if observer != nil {
            NotificationCenter.default.removeObserver(observer!)
            observer = nil
        }
    }
    
    private func startObserving() {
        if observer != nil { return }
        observer = NotificationCenter.default.addObserver(forName: notificationName, object: nil, queue: nil, using: { [weak self] (notification) in
            
            self?.handleNotification(notification)
        })
        
    }
    
    private func handleNotification(_ notification: Notification) {
        if counter.increment() >= repeatTimes {
            fire()
            counter.reset()
        }
    }
    
}
