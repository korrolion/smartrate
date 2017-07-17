//
//  SMEventsCounter.swift
//  smartrate
//
//  Created by Igor Korolev on 17.07.17.
//
// Counter for events

import Foundation

final class SMEventsCounter {
    
    private static let kPrefix = "kSMEventsCounter"
    
    private let key: String
    
    init(key: String) {
        self.key = SMEventsCounter.kPrefix + key
    }
    
    func increment() -> Int {
        let defaults = UserDefaults.standard
        let cnt = defaults.integer(forKey: key) + 1
        defaults.set(cnt, forKey: key)
        defaults.synchronize()
        
        return cnt
    }
    
    var value: Int {
        get {
            let defaults = UserDefaults.standard
            return defaults.integer(forKey: key)
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: key)
            defaults.synchronize()
        }
        
    }
    
    func reset() {
        let defaults = UserDefaults.standard
        defaults.set(0, forKey: key)
        defaults.synchronize()
    }
}
