//
//  ReusableCellTest.swift
//  pruebaCoreTests
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import XCTest

class ReusableCellTest: XCTestCase {

    func testReusableCell_01() {

        let reuseIdentifier = TestCell.reuseIdentifier
        XCTAssertEqual(reuseIdentifier, "TestCell")
    }

}
