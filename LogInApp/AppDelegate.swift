//
//  AppDelegate.swift
//  LogInApp
//
//  Created by Zeynep Sude Yıldız on 23.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func check() {
        
        if  UserDefaults.standard.bool(forKey: "loginSuccess") == true  {
           let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController")
            let navVC = UINavigationController(rootViewController: vc)
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
        }else{
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController")
             let navVC = UINavigationController(rootViewController: vc)
             let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
             window?.rootViewController = navVC
             window?.makeKeyAndVisible()
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        check()
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)

    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

