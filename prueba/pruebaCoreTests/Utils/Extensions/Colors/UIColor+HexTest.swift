//
//  UIColor+HexTest.swift
//  pruebaCoreTests
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import XCTest
@testable import pruebaCore

class UIColor_HexTest: XCTestCase {

    func testHex_01() {
        XCTAssertNotNil(UIColor(rgb: 0x000000))
    }

}
