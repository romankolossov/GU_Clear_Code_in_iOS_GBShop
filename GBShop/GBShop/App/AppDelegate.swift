//
//  AppDelegate.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.02.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Public properties

    enum TypeInterfaceOrientationMask {
        case all
        case portrait
        case landscape
    }
    var restrictRotation: TypeInterfaceOrientationMask = .portrait

    static let baseUrlGitGB = URL(
        string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/") ?? URL(fileURLWithPath: ""
        )
    static let baseUrlHeroku = URL(
        string: "https://sheltered-castle-91706.herokuapp.com/") ?? URL(fileURLWithPath: ""
        )
    static let baseUrlLocal = URL(
        string: "http://127.0.0.1:8080/") ?? URL(fileURLWithPath: ""
        )
    // let requestFactory = RequestFactory()

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

        // the commented code Auth RequestFactory bellow done as an example. There is no need in it since it is covered by the RequestFactory tests

        // MARK: - Auth RequestFactory

        //        let authFactory: AuthRequestFactory = requestFactory.makeAuthRequestFatory()
        //
        //        authFactory.login(userName: "Somebody", password: "mypassword") { response in
        //            switch response.result {
        //            case .success(let login):
        //                print("\n", login)
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //        }

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
