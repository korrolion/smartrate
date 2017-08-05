//
//  SMTrigger.swift
//  Pods
//
//  Created by Igor Korolev on 17.07.17.
//
//  Base class for trigger

import Foundation
import StoreKit


public class SMTrigger: NSObject {
    
    //MARK: - Public
    
    public var customFireCompletion: (() -> ())?
    
    //MARK: - Private
    
    internal func fire() -> Bool {
        if SMBlocker.shared.isBlocked { return false }
        SMBlocker.shared.setFireDate()
        
        if let customFire = customFireCompletion {
            customFire()
            return true
        }
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        }
        
        return true
    }
    
    internal override init() {
        super.init()
    }
}
