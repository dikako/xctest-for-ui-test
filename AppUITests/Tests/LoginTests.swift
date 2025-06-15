//
//  pocUITests.swift
//  pocUITests
//
//  Created by Fransiskus Andika Setiawan on 11/06/25.
//

import XCTest

final class LoginTests: XCTestCase {
    let app = XCUIApplication()
    var loginPage: LoginPage!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.activate()
        loginPage = LoginPage()
    }
    
    private func loginAndVerify(username: String, password: String, expectedText: String) {
        loginPage.login(username: username, password: password)
        loginPage.assertWelcomeMessage(expectedText: expectedText)
    }
    
    
    @MainActor
    func testSuccessLogin() {
        loginAndVerify(username: "dika", password: "password123", expectedText: "Welcome bro dika!")
    }
    
    @MainActor
    func testFailedLogin() {
        let testDatas = [
            ("dikakoko1", "password123", "You not my bro dikakoko1!"),
            ("dikakoko2", "password123", "You not my bro dikakoko2!"),
            ("dikakoko3", "password123", "You not my bro dikakoko3!"),
            ("dikakoko4", "password123", "You not my bro dikakoko4!")
        ]
        
        for (username, password, expectedText) in testDatas {
            XCTContext.runActivity(named: "Failed Login with \(username) and \(password)") { _ in
                loginAndVerify(username: username, password: password, expectedText: expectedText)
            }
        }
    }
}
