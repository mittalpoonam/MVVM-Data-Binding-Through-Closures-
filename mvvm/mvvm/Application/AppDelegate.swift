//
//  AppDelegate.swift
//  mvvm
//
//  Created by poonam mittal on 23/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}




// UIKit should not be there in ViewModel -> View model ki class me UIKit Nahi hona chahiye
    // ViewModel never knows about view or what view does?
// How communication will occur with view ? -> communication ko bolte hai MVVM Binding/ data binding
// 1.Protocol-delegate
// 2. Closures
// 3, Property Observer(BOX) -> didSet, willSet
// 4. FRP(Functional reactive programming) - RX, Combine
