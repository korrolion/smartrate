//
//  SMBlocker.swift
//  Pods
//
//  Created by Igor Korolev on 17.07.17.
//
//  Realization of blocking logic
//  Block is connected with app version
//  After changing the version block will be removed

import Foundation

public final class SMBlocker: NSObject {
    
    // MARK: - Public
    
    public static var shared: SMBlocker = {
        let blocker = SMBlocker()
        blocker.setLaunchDateIfNeeded()
        return blocker
    }()
    
    //Do not show rating n seconds after install
    public var minTimeAfterInstalled = 3600 * 24 * 5 // 5 days
    
    //Do not show rating n seconds after fire
    public var minTimeAfterFire = 3600 * 24 * 10 // 10 days
    
    //Do not show rating n seconds after launch
    public var minTimeAfterLaunch = 10 // 10 seconds
    
    //Show rating for every new version of app
    //false to show rating once
    public var showRatingForEveryVersion = true
    
    
    var isBlocked: Bool {
        let defaults = UserDefaults.standard
        guard let installDate = defaults.object(forKey: kInstallDate) as? Date else { return true }
        
        //Should wait after install
        let expireInstallDate = installDate.addingTimeInterval(TimeInterval(minTimeAfterInstalled))
        if case .orderedDescending = expireInstallDate.compare(Date()) { return true }
        //Should wait after launch
        let expireLaunchDate = launchDate.addingTimeInterval(TimeInterval(minTimeAfterLaunch))
        if case .orderedDescending = expireLaunchDate.compare(Date()) { return true }
        //Should wait after fire
        if let fireDate = defaults.object(forKey: kFireDate) as? Date {
            let expireFireDate = fireDate.addingTimeInterval(TimeInterval(minTimeAfterFire))
            if case .orderedDescending = expireFireDate.compare(Date()) { return true }
        }
        
        
        guard let version = UserDefaults.standard.string(forKey: kBlockedVersion) else { return false }
        //Blocked if we should show rating once
        if !showRatingForEveryVersion { return true }
        
        return version == currentAppVersion
    }
    
    func setBlock() {
        let defaults = UserDefaults.standard
        defaults.set(currentAppVersion, forKey: kBlockedVersion)
        defaults.synchronize()
    }
    
    //MARK: - Private
    
    private let kBlockedVersion = "SMkBlockedVersion"
    private let kInstallDate = "SMkInstallDate"
    private let kFireDate = "SMkFireDate"
    
    private var launchDate = Date()
    
    func setFireDate() {
        let defaults = UserDefaults.standard
        defaults.set(Date(), forKey: kFireDate)
        defaults.synchronize()
    }
    
    func setLaunchDateIfNeeded() {
        let defaults = UserDefaults.standard
        if let _ = defaults.object(forKey: kInstallDate) as? Date {
            return
        }
        defaults.set(Date(), forKey: kInstallDate)
        defaults.synchronize()
    }
    
    private var currentAppVersion: String = {
        return (Bundle.main.infoDictionary?[String(kCFBundleVersionKey)] as? String) ?? "unknownVersion"
    }()
    
    //Singleton
    override private init() {
        super.init()
    }
    
}

