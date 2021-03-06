//
//  TabBarController.swift
//  GBShop
//
//  Created by Roman Kolosov on 07.03.2021.
//

import UIKit

class TabBarController: UITabBarController, NibNameLoadable {

    // MARK: - Initializers

    init() {
        super.init(nibName: TabBarController.nibName, bundle: Bundle.main)
        viewControllers = createViewControllers()

        tabBar.backgroundColor = .tabBarBackgroundColor
        tabBar.tintColor = .tabBarTintColor
    }
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    // MARK: Configure

    private func createViewControllers() -> [UIViewController] {
        var controllers: [UIViewController] = [UIViewController]()

        // Main tab

        let mainViewController = MainViewController()
        let mainVCTabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        mainViewController.tabBarItem = mainVCTabBarItem

        let mainNavigationController = UINavigationController(
            rootViewController: mainViewController
        )
        controllers.append(mainNavigationController)

        // Search tab

        let searchViewController = SearchViewController()
        let searchVCTabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "magnifyingglass"),
            selectedImage: UIImage(systemName: "magnifyingglass.circle.fill")
        )
        searchViewController.tabBarItem = searchVCTabBarItem

        let searchNavigationController = UINavigationController(
            rootViewController: searchViewController
        )
        controllers.append(searchNavigationController)

        // Cart tab

        let cartViewController = CartViewController()
        let cartVCTabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "cart"),
            selectedImage: UIImage(systemName: "cart.fill")
        )
        cartViewController.tabBarItem = cartVCTabBarItem

        let cartNavigationController = UINavigationController(
            rootViewController: cartViewController
        )
        controllers.append(cartNavigationController)

        // Review tab

        let reviewViewController = ReviewViewController()
        let reviewVCTabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "text.bubble"),
            selectedImage: UIImage(systemName: "text.bubble.fill")
        )
        reviewViewController.tabBarItem = reviewVCTabBarItem

        let reviewNavigationController = UINavigationController(
            rootViewController: reviewViewController
        )
        controllers.append(reviewNavigationController)

        // User tab

        let userViewController = UserViewController()
        let userVCTabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "person.crop.circle"),
            selectedImage: UIImage(systemName: "person.crop.circle.fill")
        )
        userViewController.tabBarItem = userVCTabBarItem

        let userNavigationController = UINavigationController(
            rootViewController: userViewController
        )
        controllers.append(userNavigationController)

        return controllers
    }

}
