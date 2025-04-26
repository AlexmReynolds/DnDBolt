//
//  AppDelegate.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = DDHomeViewController()
        let nav = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = nav
        
        self.window?.makeKeyAndVisible()

        return true
    }

}

