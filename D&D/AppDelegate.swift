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
        UINavigationBar.appearance().backgroundColor = UIColor(white: 0.2, alpha: 1.0)
        UINavigationBar.appearance().barTintColor = UIColor(white: 0.2, alpha: 1.0)
            
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        self.window?.rootViewController = nav
        
        self.window?.makeKeyAndVisible()

        return true
    }

}

