//
//  AppDelegate.swift
//  Lesson10
//
//  Created by OUT-Shneyderman-MY on 18/5/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController  = UINavigationController(rootViewController: ViewController())
    window?.makeKeyAndVisible()
    
    
    
    
    return true
  }

 

}

