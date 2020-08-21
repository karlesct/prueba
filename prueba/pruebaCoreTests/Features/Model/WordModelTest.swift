//
//  WordModelTest.swift
//  pruebaCoreTests
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import XCTest
@testable import pruebaCore

class WordModelTest: XCTestCase {

    var wordModel: WordModel!

    override func setUp() {
        super.setUp()

        wordModel = WordModel(word: "test", count: 6, position: 10)

    }

    func testWordAndAppearance_01() {

        XCTAssertEqual(wordModel.word, "test")
        XCTAssertEqual(wordModel.count, 6)
        XCTAssertEqual(wordModel.position, 10)
    }

}
