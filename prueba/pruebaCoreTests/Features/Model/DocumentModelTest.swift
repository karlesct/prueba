//
//  DocumentModelTest.swift
//  pruebaCoreTests
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import XCTest
@testable import pruebaCore

class DocumentModelTest: XCTestCase {

    var documentModel: DocumentModel!

    override func setUp() {
        super.setUp()

        let wordModel = [WordModel(word: "test", count: 6, position: 10),
                         WordModel(word: "test1", count: 9, position: 20)]

        documentModel = DocumentModel(name: "test.txt", words: wordModel)

    }

    func testWordAndAppearance_01() {

        XCTAssertEqual(documentModel.name, "test.txt")
        XCTAssertEqual(documentModel.words[0].word, "test")
        XCTAssertEqual(documentModel.words[0].count, 6)
        XCTAssertEqual(documentModel.words[0].position, 10)
        XCTAssertEqual(documentModel.words[1].word, "test1")
        XCTAssertEqual(documentModel.words[1].count, 9)
        XCTAssertEqual(documentModel.words[1].position, 20)
    }

}
