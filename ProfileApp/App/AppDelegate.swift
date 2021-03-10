//
//  AppDelegate.swift
//  ProfileApp
//
//  Created by Somaye Sabeti on 3/3/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = ProfileViewController()
        self.window?.makeKeyAndVisible()
        return true
    }

}

