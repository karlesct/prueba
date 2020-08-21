//
//  String+IndexOfTest.swift
//  pruebaCoreTests
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import XCTest
@testable import pruebaCore

class String_IndexOfTest: XCTestCase {

    var text: String!

    override func setUp() {
        super.setUp()

        text = """
        Hugo Pedro Alicia Carlos alicia pedro Pedro Alicia Carlos alicia pedro Pedro Alicia
        Carlos alicia hugo
        pedro
        Hugo
        """

    }

    func testIndexOf_01() {

        let position = text.lowercased().getIndexOf(text: "hugo")

        XCTAssertEqual(position, 0)
    }

    func testIndexOf_02() {

        let position = text.lowercased().getIndexOf(text: "pedro")

        XCTAssertEqual(position, 5)
    }

    func testIndexOf_03() {

        let position = text.lowercased().getIndexOf(text: "pe")

        XCTAssertEqual(position, 5)
    }

    func testIndexOf_04() {

        let position = text.lowercased().getIndexOf(text: "car")

        XCTAssertEqual(position, 18)
    }

    func testIndexOf_05() {

        let position = text.lowercased().getIndexOf(text: "cia")

        XCTAssertEqual(position, 14)
    }

}
