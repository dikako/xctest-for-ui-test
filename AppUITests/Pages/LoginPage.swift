//
//  LoginPage.swift
//  UIXCTest
//
//  Created by Fransiskus Andika Setiawan on 15/06/25.
//

import XCTest

class LoginPage {
    private let locator = LocatorProvider.shared

    var fieldUsername: XCUIElement {
        return locator.element(for: "FIELD_USERNAME")
    }

    var fieldPassword: XCUIElement {
        return locator.element(for: "FIELD_PASSWORD")
    }

    var btnLogin: XCUIElement {
        return locator.element(for: "BTN_LOGIN")
    }

    var textWelcomeMessage: XCUIElement {
        return locator.element(for: "TXT_WELCOME_MESSAGE")
    }

    func login(username: String, password: String) {
        fieldUsername.clearAndEnterText(username)
        fieldPassword.clearAndEnterText(password)
        btnLogin.tap()
    }

    func assertWelcomeMessage(expectedText: String) {
        XCTAssertTrue(textWelcomeMessage.waitForExistence(timeout: 10), expectedText)
    }
}
