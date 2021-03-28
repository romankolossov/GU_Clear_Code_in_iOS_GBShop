//
//  AppDelegate.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.02.2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Public properties

    // Restrict InterfaceOrientation with portrait type only for all screens
    // InterfaceOrientation type for particular screen may be change inside its view controller

    enum TypeInterfaceOrientationMask {
        case all
        case portrait
        case landscape
    }
    var restrictRotation: TypeInterfaceOrientationMask = .portrait

    static let requestFactory = RequestFactory()

    // MARK: - Public methods

    // MARK: InterfaceOrientations

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        switch self.restrictRotation {
        case .all:
            return UIInterfaceOrientationMask.all
        case .portrait:
            return UIInterfaceOrientationMask.portrait
        case .landscape:
            return UIInterfaceOrientationMask.landscape
        }
    }

    // MARK: DidFinishLaunchingWithOptions

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Use the Firebase library to configure APIs.
          FirebaseApp.configure()
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
