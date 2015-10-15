//
//  AppDelegate.swift
//  Dynamics
//
//  Created by Julian Grosshauser on 09/10/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.backgroundColor = .whiteColor()
        return window
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let listController = ListController()
        let navigationController = UINavigationController(rootViewController: listController)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

