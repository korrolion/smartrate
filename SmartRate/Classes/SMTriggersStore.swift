//
//  SMTriggersStore.swift
//  Pods
//
//  Created by Igor Korolev on 17.07.17.
//
//  Storage of triggers

import Foundation


public final class SMTriggersStore: NSObject {
    
    // MARK: - Public
    
    public static var shared: SMTriggersStore = {
        return SMTriggersStore()
    }()
    
    public func addTrigger(_ trigger: SMTrigger) {
        storage.append(trigger)
    }
    
    // MARK: - Private
    
    private var storage: [SMTrigger] = []
}
