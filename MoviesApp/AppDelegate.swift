//
//  AppDelegate.swift
//  MoviesApp
//
//  Created by Imanol Ortiz on 24/6/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let navController = UINavigationController(rootViewController: ViewController())
        window?.backgroundColor = .systemBackground
        window?.rootViewController = navController
        
        return true
        
    }


}

