//
//  AppDelegate.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.02.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // let requestFactory = RequestFactory()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        // No need in the commented code bellow since it is covered by the RequestFactory tests
        /*
         
        // MARK: - Auth RequestFactory
        
        let authFactory: AuthRequestFactory = requestFactory.makeAuthRequestFatory()
        
        authFactory.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
            print(error.localizedDescription)
            }
        }
        
        // MARK: - SignUp RequestFactory
        
        let signUpFactory: SignUpRequestFactory = requestFactory.makeSignUpRequestFactory()
        
        signUpFactory.signUp(id: "123", userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // MARK: - ChangeUserData RequestFactory
        
        let changeUserDataFactory: ChangeUserDataRequestFactory = requestFactory.makeChangeUserDataRequestFactory()
        
        changeUserDataFactory.changeUserData(id: "123", userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // MARK: - Logout RequestFactory
        
        let logoutFactory: LogoutRequestFactory = requestFactory.makeLogoutRequestFactory()
        
        logoutFactory.logout(id: "123") { response in
            switch response.result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // MARK: - CatalogData RequestFactory
        
        let catalogDataFactory: CatalogDataRequestFactory = requestFactory.makeCatalogDataRequestFactory()
        
        catalogDataFactory.catalogData(id: "1", pageNumber: "1") { response in
            switch response.result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // MARK: - GetGoodById RequestFactory
        
        let getGoodByIDFactory: GetGoodByIdRequestFactory = requestFactory.makeGetGoodByIdRequestFactory()
        
        getGoodByIDFactory.getGoodById(id: "123") { response in
            switch response.result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        */
        
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

