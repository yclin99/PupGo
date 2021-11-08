//
//  PupGoApp.swift
//  Shared
//
//  Created by Hsin-Wei Yu on 11/5/21.
//

import SwiftUI
import Firebase
import GoogleSignIn
import FBSDKCoreKit


@main
struct PupGoApp: App {
    // Connecting App Delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Initializing Firebase
        
        FBSDKCoreKit.ApplicationDelegate.shared.application(
                    application,
                    didFinishLaunchingWithOptions: launchOptions
                )
        FirebaseApp.configure()
        return true
    }
    
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
      -> Bool {
          ApplicationDelegate.shared.application(
                      application,
                      open: url,
                      sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                      annotation: options[UIApplication.OpenURLOptionsKey.annotation]
                  )
      return GIDSignIn.sharedInstance.handle(url)
    }
}
