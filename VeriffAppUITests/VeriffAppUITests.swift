//
//  VeriffAppUITests.swift
//  VeriffAppUITests
//
//  Created by ramil on 17.06.2020.
//  Copyright © 2020 com.ri. All rights reserved.
//

import XCTest

class VeriffAppUITests: XCTestCase {

    let veriffApp = XCUIApplication(bundleIdentifier: "Veriff.Trial")

    override func setUp() {
        veriffApp.launch()
    }
    
    override func tearDown() {
        veriffApp.terminate()
    }
    
    func testVeriffApp() throws {
        
        print(veriffApp.description)
        print(veriffApp.debugDescription)
        
        _ = veriffApp.wait(for: .runningForeground, timeout: 5)
        
        if veriffApp.staticTexts["Welcome to Veriff."].exists {
            
            let descriptionText = "The easiest, safest and most convenient way to verify yourself."
            XCTAssert(veriffApp.staticTexts[descriptionText].exists)
            
            XCTAssert(veriffApp.textFields["Full name"].exists)
            XCTAssert(veriffApp.textFields["Document country"].exists)
            XCTAssert(veriffApp.textFields["Document type"].exists)
            XCTAssert(veriffApp.textFields["Session language"].exists)
        }
        
        let tryVeriffButton = veriffApp.buttons["TRY VERIFF"]
        if tryVeriffButton.exists {
            tryVeriffButton.tap()
        }
        
    }
}
