//  AppDelegate.swift
//  marketTracker
//  Created by Garth Snyder on 2019-02-15.      //  Copyright © 2018 Garth Snyder. All rights reserved.
import UIKit

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    lazy var orientationLock = UIInterfaceOrientationMask.all     // set orientations you want allowed by default
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return orientationLock
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        pryntApplicationStatusWithSpaces(applicationState: "will finish launching", extraLines: 0)
        getFeeds()
        return true
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UINavigationBar.appearance().barTintColor = navyBlue
        
        statusBar = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = navyBlue
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = lightBlue
        window?.makeKeyAndVisible()
        
        navController = UINavigationController(rootViewController: tradePanelVC)
        window?.rootViewController = navController          //; print("VCs*: \(String(describing: navController?.viewControllers))")
        
        pryntApplicationStatusWithSpaces(applicationState: "finished launching", extraLines: 1)
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        pryntApplicationStatusWithSpaces(applicationState: "became active", extraLines: 1)
        
        if tradePanelVC.loadedTimetable {
            getFeeds()
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {pryntApplicationStatusWithSpaces(applicationState: "will resign active", extraLines: 1)}
    
    func applicationDidEnterBackground(_ application: UIApplication) {pryntApplicationStatusWithSpaces(applicationState: "entered background", extraLines: 1)}
    func applicationWillEnterForeground(_ application: UIApplication) {pryntApplicationStatusWithSpaces(applicationState: "will enter foreground", extraLines: 1)}
    
    func applicationWillTerminate(_ application: UIApplication) {       print("terminated")}
    
    func pryntApplicationStatusWithSpaces(applicationState: String, extraLines: Int) {
        var line = 0
        while line < extraLines {       print("")
            line += 1
        }                               ; print("                                       \(applicationState)*")
    }
}
