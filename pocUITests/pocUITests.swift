//
//  pocUITests.swift
//  pocUITests
//
//  Created by Fransiskus Andika Setiawan on 11/06/25.
//

import XCTest

final class pocUITests: XCTestCase {

    @MainActor
    func testLogin_dikakoko1() {
              loginAndVerify(username: "dikakoko1", expectedText: "You not my bro dikakoko1!")
    }

    @MainActor
    func testLogin_dikakoko2() {
        loginAndVerify(username: "dikakoko2", expectedText: "You not my bro dikakoko2!")
    }

    @MainActor
    func testLogin_dikakoko3() {
        loginAndVerify(username: "dikakoko3", expectedText: "You not my bro dikakoko3!")
    }

    @MainActor
    func testLogin_dikakoko4_case1() {
        loginAndVerify(username: "dikakoko4", expectedText: "You not my bro dikakoko4!")
    }

    @MainActor
    func testLogin_dikakoko4_case2() {
        loginAndVerify(username: "dikakoko4", expectedText: "You not my bro dikakoko4!")
    }

    @MainActor
    func testLogin_dikakoko4_case3() {
        loginAndVerify(username: "dikakoko4", expectedText: "You not my bro dikakoko4!")
    }

    @MainActor
    func testLogin_dikakoko4_case4() {
        loginAndVerify(username: "dikakoko4", expectedText: "You not my bro dikakoko4!")
    }

    @MainActor
    func testLogin_dikakoko4_case5() {
        loginAndVerify(username: "dikakoko4", expectedText: "You not my bro dikakoko4!")
    }

    @MainActor
    func testLogin_dikakoko4_case6() {
        loginAndVerify(username: "dikakoko4", expectedText: "You not my bro dikakoko4!")
    }

    @MainActor
    func testLogin_dika() {
        loginAndVerify(username: "dika", expectedText: "Welcome bro dika!")
    }

    private func loginAndVerify(username: String, expectedText: String) {
        let app = XCUIApplication()
        app.activate()

        let fieldUsername = app.textFields["fieldUsername"]
        let fieldPassword = app.secureTextFields["fieldPassword"]
        let btnLogin = app.buttons["btnLogin"]
        let textWelcomeMessage = app.staticTexts["txtWelcomeMessage"]

        fieldUsername.tap()
        fieldUsername.typeText(username)
        
        fieldPassword.tap()
        fieldPassword.typeText("password123")
        
        btnLogin.tap()

        XCTAssertTrue(
            textWelcomeMessage.waitForExistence(timeout: 10),
            expectedText
        )
    }
}
