//
//  AppDelegate.swift
//  ANLoader
//
//  Created by anscoder on 08/17/2017.
//  Copyright (c) 2017 anscoder. All rights reserved.
//

import UIKit
import ANLoader

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //Set Up ANLoader
        ANLoader.activityBackgroundColor = .red
        ANLoader.pulseAnimation = true
        //ANLoader.activityTextColor = .clear
        //ANLoader.activityColor = .darkGray
        return true
    }
    
}

