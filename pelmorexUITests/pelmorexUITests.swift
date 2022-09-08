//
//  pelmorexUITests.swift
//  pelmorexUITests
//
//  Created by Mert Köksal on 6.09.2022.
//

import XCTest

class pelmorexUITests: XCTestCase {

        func testNameChecked() {
            let app = XCUIApplication()
            app.launch()
            
            let questionButton = app/*@START_MENU_TOKEN@*/.staticTexts["Question?"]/*[[".buttons[\"Question?\"].staticTexts[\"Question?\"]",".staticTexts[\"Question?\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            let weatherDetailPage = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .textField).element
            let checkButton = app.buttons["Check"]
            let emailTFChecked =  app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .textField).element
            
            questionButton.tap()
            weatherDetailPage.tap()
            checkButton.tap()
            emailTFChecked.tap()
            XCTAssert(emailTFChecked.exists)
    }
    
    func testDegreeSegment() {
        
        let app = XCUIApplication()
        app.launch()
        let questionButtonLo = app/*@START_MENU_TOKEN@*/.staticTexts["Question?"]/*[[".buttons[\"Question?\"].staticTexts[\"Question?\"]",".staticTexts[\"Question?\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let tf = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1)
        let tfEmail = app.staticTexts["Email"]
        let button = app.buttons["Check"]
        let nb = app.navigationBars["pelmorex.QuestionVC"].buttons["Back"]
        let segOne =  app/*@START_MENU_TOKEN@*/.buttons["°F"]/*[[".segmentedControls.buttons[\"°F\"]",".buttons[\"°F\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let segZero = app/*@START_MENU_TOKEN@*/.buttons["°C"]/*[[".segmentedControls.buttons[\"°C\"]",".buttons[\"°C\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      
        
        questionButtonLo.tap()
        tf.tap()
        tfEmail.tap()
        button.tap()
        nb.tap()
        segOne.tap()
        segZero.tap()
        XCTAssert(segZero.exists)
        
        
    }
    
}
