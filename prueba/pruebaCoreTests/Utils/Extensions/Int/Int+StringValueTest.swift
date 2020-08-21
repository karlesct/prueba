//
//  Int+StringValueTest.swift
//  pruebaCoreTests
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import XCTest

class Int_StringValueTest: XCTestCase {

    func testStringValue_01() {
        
        XCTAssertEqual(0.stringValue, "0")
        
    }
    
    func testStringValue_02() {
        
        let int: Int? = 3
        
        XCTAssertEqual(int?.stringValue, "3")
        
    }
    
    func testStringValue_03() {
        
        let int: Int? = 03
        
        XCTAssertEqual(int?.stringValue, "3")
        
    }

}
