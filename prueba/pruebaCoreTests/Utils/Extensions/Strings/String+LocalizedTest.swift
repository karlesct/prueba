//
//  String+LocalizedTest.swift
//  pruebaCoreTests
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import XCTest
@testable import pruebaCore

class String_LocalizedTest: XCTestCase {
    
    func testLocalized_01() {
        
        XCTAssertEqual("missing_key".localized, "**missing_key**")
    }
    
    func testLocalized_02() {
        
        XCTAssertEqual("app_missing_key".localized, "**app_missing_key**")
    }
    
    func testLocalized_03() {
        
        XCTAssertEqual("NumberOfAppearances".localized, "Appearances")
    }
    
    func testLocalized_04() {
        
        XCTAssertEqual("ToStartSelectAFile".localized, "To start please select a file")
    }
    
}
