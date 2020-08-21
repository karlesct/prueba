//
//  String+EmptyTest.swift
//  pruebaCoreTests
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import XCTest
import pruebaCore

class String_EmptyTest: XCTestCase {

    func testEmptyOK_01() {
        
        XCTAssertEqual(.empty, "")
        
    }

}
