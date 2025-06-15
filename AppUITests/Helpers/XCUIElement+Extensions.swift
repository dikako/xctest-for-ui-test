//
//  XCUIElement+Extensions.swift
//  UIXCTest
//
//  Created by Fransiskus Andika Setiawan on 15/06/25.
//

import XCTest

extension XCUIElement {
    func clearAndEnterText(_ text: String) {
        guard self.exists else {
            XCTFail("Element does not exist: \(self)")
            return
        }
        
        self.tap()
        
        if let currentValue = self.value as? String, !currentValue.isEmpty {
            let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentValue.count)
            self.typeText(deleteString)
        }
        
        self.typeText(text)
    }
}
