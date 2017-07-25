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
    
    internal func fire() {
        if SMBlocker.shared.isBlocked { return }
        SMBlocker.shared.setFireDate()
        
        if let customFire = customFireCompletion {
            customFire()
            return
        }
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        }
    }
    
    internal override init() {
        super.init()
    }
}
