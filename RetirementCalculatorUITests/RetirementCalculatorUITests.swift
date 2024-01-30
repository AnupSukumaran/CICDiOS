//
//  RetirementCalculatorUITests.swift
//  RetirementCalculatorUITests
//
//  Created by sukumar.sukumaran on 18/10/2023.
//

import XCTest

final class RetirementCalculatorUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        app = XCUIApplication()
        app.launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }

    func testExample() throws {
        
        XCTContext.runActivity(named: "screenshot") { activity in
            let monthlyInvestmentsTextField =  app.textFields["Monthly investments"]
            monthlyInvestmentsTextField.tap()
            monthlyInvestmentsTextField.typeText("100")
          
            let currentAgeField = app.textFields["Your current age"]
            currentAgeField.tap()
            currentAgeField.typeText("30")
            
            
            let retiredAgeTF = app.textFields["Your planned retirement age"]
            retiredAgeTF.tap()
            retiredAgeTF.typeText("65")
            
            
            let investRateField = app.textFields["Average interest rate of investments"]
            investRateField.tap()
            investRateField.typeText("3")
           
            let currentDavingTf = app.textFields["Current savings"]
            currentDavingTf.tap()
            currentDavingTf.typeText("1000")
           
            app/*@START_MENU_TOKEN@*/.staticTexts["Calculate retirement amount"]/*[[".buttons[\"Calculate retirement amount\"].staticTexts[\"Calculate retirement amount\"]",".staticTexts[\"Calculate retirement amount\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                    
            let resultText = app.staticTexts.element(matching: .any, identifier: "resultLabel")
            
            let result = "If you save $100.0 every month for 35 years, and invest that money plus your current investment of $1000.0 at a 3.0% anual interest rate, you will have $246467878.4603446 by the time you are 65"
            XCTAssertEqual(resultText.label, result)
        }
        
       
        
                
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
