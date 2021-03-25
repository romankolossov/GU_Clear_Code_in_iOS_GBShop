//
//  GBShopUITests.swift
//  GBShopUITests
//
//  Created by Roman Kolosov on 10.02.2021.
//

import XCTest

class GBShopUITests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Device settings test

    func testSettings() throws {
        // To see the settings of the device
        let app = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
        app.launch()
        print("\(app.debugDescription)")
    }

    // MARK: - Signin test

    func testSingIn() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        // The arguments can be used as launch options in the app delegate in order to change behavior of the app
        app.launchArguments = ["singInTest"]
        app.launch()

        // Main view controller

        let barButtonItem = app.navigationBars.buttons["signInBarButtonItem"].firstMatch
        XCTAssertTrue(barButtonItem.isHittable, "\(app.debugDescription)")

        barButtonItem.tap() // to enter in SignIn screen

        // SignIn View (subview of SignIn view controller view)

        let signInView = app.scrollViews["signInView"].firstMatch
        XCTAssertTrue(signInView.waitForExistence(timeout: 1.0), "\(app.debugDescription)")

        let userNameTextField = signInView.textFields["userNameTextField"]
        XCTAssertTrue(userNameTextField.exists)
        userNameTextField.tap()
        userNameTextField.typeText("Somebody")

        let passwordTextField = signInView.textFields["passwordTextField"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText("mypassword")

        // Hide keyboard by taping on the parent view of text fields to reveal signInButton.
        signInView.tap()
        // Wait till keyboard disapears.
        RunLoop.current.run(until: Date(timeInterval: 2, since: Date()))

        // SignIn view controller view

        let signInVCView = app.otherElements["signInVCView"].firstMatch
        XCTAssertTrue(signInVCView.waitForExistence(timeout: 1.0), "\(app.debugDescription)")

        let signInButton = signInVCView.buttons["signInButton"]
        XCTAssertTrue(signInButton.isHittable)

        signInButton.tap()

        // Handle alert show and OK button tap on it.
        checkAuth(message: "")

    }

    private func checkAuth(message: String) {
        let app = XCUIApplication()
        // addUIInterruptionMonitor used to handle UI tests of apps with alerts.
        let token = addUIInterruptionMonitor(
            withDescription: message
        ) { alert in
                alert.buttons["OK"].tap()
                return true
        }
        // Give time to the alert to finish its work after OK button pressed.
        RunLoop.current.run(until: Date(timeInterval: 2, since: Date()))
        // Renew interaction with the app.
        app.tap()

        removeUIInterruptionMonitor(token)
    }

/*
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
 */

}
