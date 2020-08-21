//
//  String+WordAndAppearanceTest.swift
//  pruebaCoreTests
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import XCTest
@testable import pruebaCore

class String_WordAndAppearanceTest: XCTestCase {

    var text: String!
    var okResult: [String: Int]!

    override func setUp() {
        super.setUp()

        text = """
        Hugo Pedro Alicia Carlos alicia pedro Pedro Alicia Carlos alicia pedro Pedro Alicia
        Carlos alicia hugo
        pedro
        Hugo
        """
        
        okResult = ["alicia":6,
                    "carlos": 3,
                    "pedro": 6,
                    "hugo": 3]
        
    }
    
   func testWordAndAppearance_01() {
    
        let test = text.wordAndAppearance
        
        XCTAssertEqual(test, okResult)
    }
    
}
