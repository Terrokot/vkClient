//
//  AppDelegate.swift
//  vkClient
//
//  Created by Egor Tereshonok on 1/21/20.
//  Copyright © 2020 Egor Tereshonok. All rights reserved.
//

import UIKit
import VK_ios_sdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AuthServiceDelegate {
    
    var window: UIWindow?
    var authService: AuthService!
    static func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        self.authService = AuthService()
        authService.delegate = self
        
        //let authVC: AuthViewController = UIStoryboard(name: "AuthViewController", bundle: nil).instantiateInitialViewController() as! AuthViewController
        let authVC: AuthViewController = AuthViewController.loadFromStoryBoard()
        
        window?.rootViewController = authVC
        window?.makeKeyAndVisible()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
        return true
    }
    
    
    func authServiceShouldShow(_ viewContloller: UIViewController) {
        print(#function)
        window?.rootViewController?.present(viewContloller, animated: true, completion: nil)
        
    }
    
    func authServiceSignIn() {
        print(#function)
        //let feedVC = UIStoryboard(name: "FeedViewController", bundle: nil).instantiateInitialViewController() as! FeedViewController
        let feedVC: FeedViewController = FeedViewController.loadFromStoryBoard()
        let navVC = UINavigationController(rootViewController: feedVC)
        window?.rootViewController = navVC
        
    }
    
    func authServiceDidSignInFail() {
        print(#function)
        
    }
    
    
    
}

