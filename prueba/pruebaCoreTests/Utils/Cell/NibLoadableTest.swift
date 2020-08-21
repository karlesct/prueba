//
//  NibLoadableTest.swift
//  pruebaCoreTests
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import XCTest

class NibLoadableTest: XCTestCase {

    func testNibLoadable_01() {

        let testCellNibName = TestCell.nibName
        XCTAssertEqual(testCellNibName, "TestCell")
    }

    func testNibLoadable_02() {

        let testCell = TestCell.instantiate()
        XCTAssertNotNil(testCell)
    }

}
