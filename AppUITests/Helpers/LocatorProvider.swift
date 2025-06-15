//
//  LocatorProvider.swift
//  UIXCTest
//
//  Created by Fransiskus Andika Setiawan on 15/06/25.
//

import Foundation
import XCTest

class LocatorProvider {
    static let shared = LocatorProvider()
    private var locators: [String: String] = [:]
    private let app = XCUIApplication()
    
    private init() {
        guard let resourceURLs = Bundle(for: LocatorProvider.self).urls(forResourcesWithExtension: "properties", subdirectory: nil) else {
            fatalError("No .properties files found in test bundle")
        }

        for url in resourceURLs {
            do {
                let content = try String(contentsOf: url, encoding: .utf8)
                let lines = content.components(separatedBy: .newlines)

                for line in lines {
                    let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard !trimmed.isEmpty, !trimmed.hasPrefix("#") else { continue }

                    let parts = trimmed.components(separatedBy: "=")
                    guard parts.count == 2 else { continue }

                    let key = parts[0].trimmingCharacters(in: .whitespaces)
                    let value = parts[1].trimmingCharacters(in: .whitespaces)

                    if locators[key] != nil {
                        print("⚠️ Duplicate key '\(key)' in properties files. Overriding previous value.")
                    }

                    locators[key] = value
                }
            } catch {
                print("❌ Failed to load properties from \(url.lastPathComponent): \(error)")
            }
        }

        if locators.isEmpty {
            fatalError("No locators loaded from .properties files.")
        }
    }
    
    func element(for key: String) -> XCUIElement {
            guard let rawValue = locators[key] else {
                fatalError("Locator not found for key: \(key)")
            }

            if rawValue.hasPrefix("textField_") {
                let identifier = rawValue.replacingOccurrences(of: "textField_", with: "")
                return app.textFields[identifier]
            } else if rawValue.hasPrefix("secureTextField_") {
                let identifier = rawValue.replacingOccurrences(of: "secureTextField_", with: "")
                return app.secureTextFields[identifier]
            } else if rawValue.hasPrefix("button_") {
                let identifier = rawValue.replacingOccurrences(of: "button_", with: "")
                return app.buttons[identifier]
            } else if rawValue.hasPrefix("staticText_") {
                let identifier = rawValue.replacingOccurrences(of: "staticText_", with: "")
                return app.staticTexts[identifier]
            } else {
                fatalError("Unsupported element prefix in value: \(rawValue)")
            }
        }
}
