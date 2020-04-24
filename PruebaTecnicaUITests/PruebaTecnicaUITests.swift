//
//  PruebaTecnicaUITests.swift
//  PruebaTecnicaUITests
//
//  Created by juan.p.arias.botella on 23/04/2020.
//  Copyright © 2020 Juan Arias. All rights reserved.
//

import XCTest

class PruebaTecnicaUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {}

    func testInterfaceUsage() {
        
        // Se debe realizar con limit: 100 y offset 200
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        let cargillStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Cargill"]/*[[".cells.staticTexts[\"Cargill\"]",".staticTexts[\"Cargill\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tablesQuery.cells.element(boundBy: 7).press(forDuration: 1, thenDragTo: cargillStaticText)
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Captain Marvel (Phyla-Vell)"]/*[[".cells.staticTexts[\"Captain Marvel (Phyla-Vell)\"]",".staticTexts[\"Captain Marvel (Phyla-Vell)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let captainMarvel200219StaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Captain Marvel (2002) #19"]/*[[".cells.staticTexts[\"Captain Marvel (2002) #19\"]",".staticTexts[\"Captain Marvel (2002) #19\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tablesQuery.cells.element(boundBy: 2).press(forDuration: 1, thenDragTo: captainMarvel200219StaticText)
        app.navigationBars["PruebaTecnica.CharacterDetailView"].buttons["Marvel Characters"].tap()
        
    }
}
