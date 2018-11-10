//
//  PhoneNumberLiveFormatUITests.swift
//  PhoneNumberLiveFormatUITests
//
//  Created by Jean-Daniel.
//  Copyright © 2019 Jean-Daniel Dupas. All rights reserved.
//

import XCTest

class PhoneNumberLiveFormatUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFieldFormatter() {
      let app = XCUIApplication().windows["PhoneNumberLiveFormat"]
      let textField = app.children(matching: .textField).element

      XCTAssertEqual("", textField.value as! String?)
      textField.typeText("0")
      XCTAssertEqual("0", textField.value as! String?)

      textField.typeText("6")
      XCTAssertEqual("06", textField.value as! String?)

      textField.typeText("8")
      XCTAssertEqual("06 8", textField.value as! String?)
      textField.typeText("9")
      XCTAssertEqual("06 89", textField.value as! String?)

      textField.typeText("5")
      XCTAssertEqual("06 89 5", textField.value as! String?)
      textField.typeText("5")
      XCTAssertEqual("06 89 55", textField.value as! String?)

      textField.typeText("5")
      XCTAssertEqual("06 89 55 5", textField.value as! String?)
      textField.typeText("5")
      XCTAssertEqual("06 89 55 55", textField.value as! String?)

      textField.typeText("5")
      XCTAssertEqual("06 89 55 55 5", textField.value as! String?)
      textField.typeText("5")
      XCTAssertEqual("06 89 55 55 55", textField.value as! String?)

      for _ in 0...10 { textField.typeKey(.leftArrow, modifierFlags: []) }

      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("0689 55 55 55", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("0 895 55 55 5", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("0895 55 55 5", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("895 55 55 5", textField.value as! String?)

      textField.typeText("+")
      XCTAssertEqual("+ 895 55 55 5", textField.value as! String?)
      textField.typeText("4")
      XCTAssertEqual("+48 95 555 55", textField.value as! String?)
      textField.typeText("4")
      XCTAssertEqual("+44 895 555 55", textField.value as! String?)

      textField.typeText("7")
      XCTAssertEqual("+44 7895 55555", textField.value as! String?)
      textField.typeText("7")
      XCTAssertEqual("+44 7789 555555", textField.value as! String?)

      for _ in 0...1 { textField.typeKey(.rightArrow, modifierFlags: [ .shift ]) }
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+44 7755 5555", textField.value as! String?)

      textField.typeText("3")
      XCTAssertEqual("+44 7735 55555", textField.value as! String?)
      textField.typeText("9")
      XCTAssertEqual("+44 7739 555555", textField.value as! String?)

      // Got to end of line
      textField.typeKey(.rightArrow, modifierFlags: [ .command ])
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+44 7739 55555", textField.value as! String?)

      for _ in 0...4 { textField.typeKey(.leftArrow, modifierFlags: []) }
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+44 773955555", textField.value as! String?)

      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+44 7735 5555", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+44 7755 555", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+44 7555 55", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+44 55 555", textField.value as! String?)

      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+4455 555", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+45 55 55", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+55 555", textField.value as! String?)

      textField.typeText("3")
      XCTAssertEqual("+355 55 5", textField.value as! String?)
      textField.typeText("9")
      XCTAssertEqual("+39 55 555", textField.value as! String?)

      textField.typeText("0")
      XCTAssertEqual("+39 055 555", textField.value as! String?)
      textField.typeText("5")
      XCTAssertEqual("+39 055 5555", textField.value as! String?)
      textField.typeText("4")
      XCTAssertEqual("+39 0545 5555", textField.value as! String?)
      textField.typeText("9")
      XCTAssertEqual("+39 0549 55555", textField.value as! String?)

      // Got to end of line
      textField.typeKey(.rightArrow, modifierFlags: [ .command ])
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+39 0549 5555", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+39 0549 555", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+39 0549 55", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+39 0549 5", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+39 0549", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+39 054", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+39 05", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+39 0", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+39", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+3", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("+", textField.value as! String?)
      textField.typeKey(.delete, modifierFlags: [])
      XCTAssertEqual("", textField.value as! String?)
    }

}
