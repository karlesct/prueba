//
//  DocumentConverterTest.swift
//  pruebaCoreTests
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import XCTest
@testable import pruebaCore

class DocumentConverterTest: XCTestCase {

    var documentConverted: DocumentModel!

    override func setUp() {
        super.setUp()

        let name = "Nombres.txt"

        let body = """
        Hugo Pedro Alicia Carlos alicia pedro Pedro Alicia Carlos alicia pedro Pedro Alicia
        Carlos alicia hugo
        pedro
        Hugo
        """

        documentConverted = DocumentConverters().convertStringToDocument(name: name,
                                                                         body: body)
    }

    func testDocumentConverter_01() {

        XCTAssertNotNil(documentConverted)

    }

}
